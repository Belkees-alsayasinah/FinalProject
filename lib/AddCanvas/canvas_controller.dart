import 'package:bloom_project/AddCanvas/canvas_model.dart';
import 'package:bloom_project/AddCanvas/canvas_service.dart';
import 'package:bloom_project/WorkerProfilePage/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCanvasController extends GetxController {
  final ProfilePageController controller = Get.find();
  late String target_audience;
  late String customers_using_our_products_or_services;
  late String customer_segments;
  late String most_important_customers;
  late String interacting_with_audience;
  late String strengthening_our_relationship_with_them;
  late String differentiating_our_relationship_from_competitors;
  late String costs_of_building_relationship;
  late String raising_awareness_of_our_existence;
  late String preferred_communication_methods_of_audience;
  late String optimal_communication_methods;
  late String cost_effective_delivery_methods;
  late String value_proposition_for_audience;
  late String problems_of_audience_we_solve;
  late String products_offered_to_each_customer_segment;
  late String audience_needs_we_fulfill;
  late String required_activities_for_our_products;
  late String required_activities_for_communication_channels;
  late String required_activities_for_audience_relationships;
  late String required_activities_for_revenue_generation;
  late String resources_required_for_product_development;
  late String resources_required_for_customer_relationships;
  late String resources_required_for_revenue_generation;
  late String key_partners;
  late String key_suppliers;
  late String key_resources_requested_from_partners;
  late String key_activities_executed_by_partners;
  late String products_audience_pays_for;
  late String current_payment_methods;
  late String preferred_payment_methods;
  late String revenue_percentage_per_product_for_project;
  late String major_costs_for_project;
  late String most_costly_key_resources;
  late String most_costly_key_activities;
  late AddCanvasService service;
  late String message;
  late bool addCanvasState;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    target_audience = '';
    customers_using_our_products_or_services = '';
    customer_segments = '';
    most_important_customers = '';
    interacting_with_audience = '';
    strengthening_our_relationship_with_them = '';
    differentiating_our_relationship_from_competitors = '';
    costs_of_building_relationship = '';
    raising_awareness_of_our_existence = '';
    preferred_communication_methods_of_audience = '';
    optimal_communication_methods = '';
    cost_effective_delivery_methods = '';
    value_proposition_for_audience = '';
    problems_of_audience_we_solve = '';
    products_offered_to_each_customer_segment = '';
    audience_needs_we_fulfill = '';
    required_activities_for_our_products = '';
    required_activities_for_communication_channels = '';
    required_activities_for_audience_relationships = '';
    required_activities_for_revenue_generation = '';
    resources_required_for_product_development = '';
    resources_required_for_customer_relationships = '';
    resources_required_for_revenue_generation = '';
    key_partners = '';
    key_suppliers = '';
    key_resources_requested_from_partners = '';
    key_activities_executed_by_partners = '';
    products_audience_pays_for = '';
    current_payment_methods = '';
    preferred_payment_methods = '';
    revenue_percentage_per_product_for_project = '';
    major_costs_for_project = '';
    most_costly_key_resources = '';
    most_costly_key_activities = '';
    service = AddCanvasService();
    addCanvasState = false;
    super.onInit();
  }

  void onClickAddCanvas(String id) async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      await addCanvasClick(id);
      if (addCanvasState) {
        controller.getdata();
        update();
      }
    }
  }

  Future<void> addCanvasClick(String id) async {
    AddCanvasModel canvas = AddCanvasModel(
      target_audience: target_audience,
      customers_using_our_products_or_services:
          customers_using_our_products_or_services,
      customer_segments: customer_segments,
      most_important_customers: most_important_customers,
      interacting_with_audience: interacting_with_audience,
      strengthening_our_relationship_with_them:
          strengthening_our_relationship_with_them,
      differentiating_our_relationship_from_competitors:
          differentiating_our_relationship_from_competitors,
      costs_of_building_relationship: costs_of_building_relationship,
      raising_awareness_of_our_existence: raising_awareness_of_our_existence,
      preferred_communication_methods_of_audience:
          preferred_communication_methods_of_audience,
      optimal_communication_methods: optimal_communication_methods,
      cost_effective_delivery_methods: cost_effective_delivery_methods,
      value_proposition_for_audience: value_proposition_for_audience,
      problems_of_audience_we_solve: problems_of_audience_we_solve,
      products_offered_to_each_customer_segment:
          products_offered_to_each_customer_segment,
      audience_needs_we_fulfill: audience_needs_we_fulfill,
      required_activities_for_our_products:
          required_activities_for_our_products,
      required_activities_for_communication_channels:
          required_activities_for_communication_channels,
      required_activities_for_audience_relationships:
          required_activities_for_audience_relationships,
      required_activities_for_revenue_generation:
          required_activities_for_revenue_generation,
      resources_required_for_product_development:
          resources_required_for_product_development,
      resources_required_for_customer_relationships:
          resources_required_for_customer_relationships,
      resources_required_for_revenue_generation:
          resources_required_for_revenue_generation,
      key_partners: key_partners,
      key_suppliers: key_suppliers,
      key_resources_requested_from_partners:
          key_resources_requested_from_partners,
      key_activities_executed_by_partners: key_activities_executed_by_partners,
      products_audience_pays_for: products_audience_pays_for,
      current_payment_methods: current_payment_methods,
      preferred_payment_methods: preferred_payment_methods,
      revenue_percentage_per_product_for_project:
          revenue_percentage_per_product_for_project,
      major_costs_for_project: major_costs_for_project,
      most_costly_key_resources: most_costly_key_resources,
      most_costly_key_activities: most_costly_key_activities,
    );
    addCanvasState = await service.addCanvas(canvas, id);
    if (addCanvasState) {
      Get.back();
      Get.back();
      Get.back();
    }
    var mapmsg = service.message;
    print('map: $mapmsg');
  }
}
