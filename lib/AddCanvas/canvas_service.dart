import 'dart:convert';

import 'package:bloom_project/AddCanvas/canvas_model.dart';

import '../Config/server_config.dart';
import '../service/info.dart';
import 'package:http/http.dart' as http;

class AddCanvasService {
  var message;

  Future<bool> addCanvas(AddCanvasModel model, String id) async {
    var response = await http.post(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().addCanvas + '$id'),
      headers: {
        'Authorization': 'Bearer ${UserInformation.user_token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "target_audience": model.target_audience,
        "customers_using_our_products_or_services":
            model.customers_using_our_products_or_services,
        "customer_segments": model.customer_segments,
        "most_important_customers": model.most_important_customers,
        "interacting_with_audience": model.interacting_with_audience,
        "strengthening_our_relationship_with_them":
            model.strengthening_our_relationship_with_them,
        "differentiating_our_relationship_from_competitors":
            model.differentiating_our_relationship_from_competitors,
        "costs_of_building_relationship": model.costs_of_building_relationship,
        "raising_awareness_of_our_existence":
            model.raising_awareness_of_our_existence,
        "preferred_communication_methods_of_audience":
            model.preferred_communication_methods_of_audience,
        "optimal_communication_methods": model.optimal_communication_methods,
        "cost_effective_delivery_methods":
            model.cost_effective_delivery_methods,
        "value_proposition_for_audience": model.value_proposition_for_audience,
        "problems_of_audience_we_solve": model.problems_of_audience_we_solve,
        "products_offered_to_each_customer_segment":
            model.products_offered_to_each_customer_segment,
        "audience_needs_we_fulfill": model.audience_needs_we_fulfill,
        "required_activities_for_our_products":
            model.required_activities_for_our_products,
        "required_activities_for_communication_channels":
            model.required_activities_for_communication_channels,
        "required_activities_for_audience_relationships":
            model.required_activities_for_audience_relationships,
        "required_activities_for_revenue_generation":
            model.required_activities_for_revenue_generation,
        "resources_required_for_product_development":
            model.resources_required_for_product_development,
        "resources_required_for_customer_relationships":
            model.resources_required_for_customer_relationships,
        "resources_required_for_revenue_generation":
            model.resources_required_for_revenue_generation,
        "key_partners": model.key_partners,
        "key_suppliers": model.key_suppliers,
        "key_resources_requested_from_partners":
            model.key_resources_requested_from_partners,
        "key_activities_executed_by_partners":
            model.key_activities_executed_by_partners,
        "products_audience_pays_for": model.products_audience_pays_for,
        "current_payment_methods": model.current_payment_methods,
        "preferred_payment_methods": model.preferred_payment_methods,
        "revenue_percentage_per_product_for_project":
            model.revenue_percentage_per_product_for_project,
        "major_costs_for_project": model.major_costs_for_project,
        "most_costly_key_resources": model.most_costly_key_resources,
        "most_costly_key_activities": model.most_costly_key_activities,
      }),
    );

    print(response.statusCode);
    print(response.body); // Print response body for debugging

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Done');
      var r = jsonDecode(response.body);
      message = r['message'];
      return true;
    } else if (response.statusCode == 404) {
      message = "Something's wrong!";
      return false;
    } else {
      // Handle other error responses
      message = jsonDecode(response.body)['error'] ?? 'Unknown error';
      return false;
    }
  }
}
