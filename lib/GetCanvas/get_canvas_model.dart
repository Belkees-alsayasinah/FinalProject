// To parse this JSON data, do
//
//     final getCanvasModel = getCanvasModelFromJson(jsonString);

import 'dart:convert';

GetCanvasModel getCanvasModelFromJson(String str) =>
    GetCanvasModel.fromJson(json.decode(str));

String getCanvasModelToJson(GetCanvasModel data) => json.encode(data.toJson());

class GetCanvasModel {
  int id;
  int projectId;
  String targetAudience;
  String customersUsingOurProductsOrServices;
  String customerSegments;
  String mostImportantCustomers;
  String interactingWithAudience;
  String strengtheningOurRelationshipWithThem;
  String differentiatingOurRelationshipFromCompetitors;
  String costsOfBuildingRelationship;
  String raisingAwarenessOfOurExistence;
  String preferredCommunicationMethodsOfAudience;
  String optimalCommunicationMethods;
  String costEffectiveDeliveryMethods;
  String valuePropositionForAudience;
  String problemsOfAudienceWeSolve;
  String productsOfferedToEachCustomerSegment;
  String audienceNeedsWeFulfill;
  String requiredActivitiesForOurProducts;
  String requiredActivitiesForCommunicationChannels;
  String requiredActivitiesForAudienceRelationships;
  String requiredActivitiesForRevenueGeneration;
  String resourcesRequiredForProductDevelopment;
  String resourcesRequiredForCustomerRelationships;
  String resourcesRequiredForRevenueGeneration;
  String keyPartners;
  String keySuppliers;
  String keyResourcesRequestedFromPartners;
  String keyActivitiesExecutedByPartners;
  String productsAudiencePaysFor;
  String currentPaymentMethods;
  String preferredPaymentMethods;
  String revenuePercentagePerProductForProject;
  String majorCostsForProject;
  String mostCostlyKeyResources;
  String mostCostlyKeyActivities;
  DateTime createdAt;
  DateTime updatedAt;

  GetCanvasModel({
    required this.id,
    required this.projectId,
    required this.targetAudience,
    required this.customersUsingOurProductsOrServices,
    required this.customerSegments,
    required this.mostImportantCustomers,
    required this.interactingWithAudience,
    required this.strengtheningOurRelationshipWithThem,
    required this.differentiatingOurRelationshipFromCompetitors,
    required this.costsOfBuildingRelationship,
    required this.raisingAwarenessOfOurExistence,
    required this.preferredCommunicationMethodsOfAudience,
    required this.optimalCommunicationMethods,
    required this.costEffectiveDeliveryMethods,
    required this.valuePropositionForAudience,
    required this.problemsOfAudienceWeSolve,
    required this.productsOfferedToEachCustomerSegment,
    required this.audienceNeedsWeFulfill,
    required this.requiredActivitiesForOurProducts,
    required this.requiredActivitiesForCommunicationChannels,
    required this.requiredActivitiesForAudienceRelationships,
    required this.requiredActivitiesForRevenueGeneration,
    required this.resourcesRequiredForProductDevelopment,
    required this.resourcesRequiredForCustomerRelationships,
    required this.resourcesRequiredForRevenueGeneration,
    required this.keyPartners,
    required this.keySuppliers,
    required this.keyResourcesRequestedFromPartners,
    required this.keyActivitiesExecutedByPartners,
    required this.productsAudiencePaysFor,
    required this.currentPaymentMethods,
    required this.preferredPaymentMethods,
    required this.revenuePercentagePerProductForProject,
    required this.majorCostsForProject,
    required this.mostCostlyKeyResources,
    required this.mostCostlyKeyActivities,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetCanvasModel.fromJson(Map<String, dynamic> json) => GetCanvasModel(
        id: json["id"],
        projectId: json["project_id"],
        targetAudience: json["target_audience"],
        customersUsingOurProductsOrServices:
            json["customers_using_our_products_or_services"],
        customerSegments: json["customer_segments"],
        mostImportantCustomers: json["most_important_customers"],
        interactingWithAudience: json["interacting_with_audience"],
        strengtheningOurRelationshipWithThem:
            json["strengthening_our_relationship_with_them"],
        differentiatingOurRelationshipFromCompetitors:
            json["differentiating_our_relationship_from_competitors"],
        costsOfBuildingRelationship: json["costs_of_building_relationship"],
        raisingAwarenessOfOurExistence:
            json["raising_awareness_of_our_existence"],
        preferredCommunicationMethodsOfAudience:
            json["preferred_communication_methods_of_audience"],
        optimalCommunicationMethods: json["optimal_communication_methods"],
        costEffectiveDeliveryMethods: json["cost_effective_delivery_methods"],
        valuePropositionForAudience: json["value_proposition_for_audience"],
        problemsOfAudienceWeSolve: json["problems_of_audience_we_solve"],
        productsOfferedToEachCustomerSegment:
            json["products_offered_to_each_customer_segment"],
        audienceNeedsWeFulfill: json["audience_needs_we_fulfill"],
        requiredActivitiesForOurProducts:
            json["required_activities_for_our_products"],
        requiredActivitiesForCommunicationChannels:
            json["required_activities_for_communication_channels"],
        requiredActivitiesForAudienceRelationships:
            json["required_activities_for_audience_relationships"],
        requiredActivitiesForRevenueGeneration:
            json["required_activities_for_revenue_generation"],
        resourcesRequiredForProductDevelopment:
            json["resources_required_for_product_development"],
        resourcesRequiredForCustomerRelationships:
            json["resources_required_for_customer_relationships"],
        resourcesRequiredForRevenueGeneration:
            json["resources_required_for_revenue_generation"],
        keyPartners: json["Key_partners"],
        keySuppliers: json["Key_suppliers"],
        keyResourcesRequestedFromPartners:
            json["Key_resources_requested_from_partners"],
        keyActivitiesExecutedByPartners:
            json["Key_activities_executed_by_partners"],
        productsAudiencePaysFor: json["products_audience_pays_for"],
        currentPaymentMethods: json["current_payment_methods"],
        preferredPaymentMethods: json["preferred_payment_methods"],
        revenuePercentagePerProductForProject:
            json["revenue_percentage_per_product_for_project"],
        majorCostsForProject: json["major_costs_for_project"],
        mostCostlyKeyResources: json["most_costly_key_resources"],
        mostCostlyKeyActivities: json["most_costly_key_activities"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "target_audience": targetAudience,
        "customers_using_our_products_or_services":
            customersUsingOurProductsOrServices,
        "customer_segments": customerSegments,
        "most_important_customers": mostImportantCustomers,
        "interacting_with_audience": interactingWithAudience,
        "strengthening_our_relationship_with_them":
            strengtheningOurRelationshipWithThem,
        "differentiating_our_relationship_from_competitors":
            differentiatingOurRelationshipFromCompetitors,
        "costs_of_building_relationship": costsOfBuildingRelationship,
        "raising_awareness_of_our_existence": raisingAwarenessOfOurExistence,
        "preferred_communication_methods_of_audience":
            preferredCommunicationMethodsOfAudience,
        "optimal_communication_methods": optimalCommunicationMethods,
        "cost_effective_delivery_methods": costEffectiveDeliveryMethods,
        "value_proposition_for_audience": valuePropositionForAudience,
        "problems_of_audience_we_solve": problemsOfAudienceWeSolve,
        "products_offered_to_each_customer_segment":
            productsOfferedToEachCustomerSegment,
        "audience_needs_we_fulfill": audienceNeedsWeFulfill,
        "required_activities_for_our_products":
            requiredActivitiesForOurProducts,
        "required_activities_for_communication_channels":
            requiredActivitiesForCommunicationChannels,
        "required_activities_for_audience_relationships":
            requiredActivitiesForAudienceRelationships,
        "required_activities_for_revenue_generation":
            requiredActivitiesForRevenueGeneration,
        "resources_required_for_product_development":
            resourcesRequiredForProductDevelopment,
        "resources_required_for_customer_relationships":
            resourcesRequiredForCustomerRelationships,
        "resources_required_for_revenue_generation":
            resourcesRequiredForRevenueGeneration,
        "Key_partners": keyPartners,
        "Key_suppliers": keySuppliers,
        "Key_resources_requested_from_partners":
            keyResourcesRequestedFromPartners,
        "Key_activities_executed_by_partners": keyActivitiesExecutedByPartners,
        "products_audience_pays_for": productsAudiencePaysFor,
        "current_payment_methods": currentPaymentMethods,
        "preferred_payment_methods": preferredPaymentMethods,
        "revenue_percentage_per_product_for_project":
            revenuePercentagePerProductForProject,
        "major_costs_for_project": majorCostsForProject,
        "most_costly_key_resources": mostCostlyKeyResources,
        "most_costly_key_activities": mostCostlyKeyActivities,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
