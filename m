Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 73626688AB6
	for <lists.virtualization@lfdr.de>; Fri,  3 Feb 2023 00:25:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A969541139;
	Thu,  2 Feb 2023 23:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A969541139
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=KJjm5pju;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kkTgL5y1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GM9Ke7zMbJPa; Thu,  2 Feb 2023 23:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 301FC410C9;
	Thu,  2 Feb 2023 23:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 301FC410C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C743C0081;
	Thu,  2 Feb 2023 23:25:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E169C002B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7CD410C9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7CD410C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULDdYpbmXKRm
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:25:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98C9B40192
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98C9B40192
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:25:35 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312IDpJ5011698; Thu, 2 Feb 2023 23:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=MBKvKy1DqZK05wLrjQpQ0abb7ZFnZuOWGN//Wm98zFY=;
 b=KJjm5pjupNv8CpIJccXweQ3J8WhY0K8ofAiYrg8DL652Gk3bXOr2oJGZwipz8RGLPdtq
 w+fH1Fc2n7ni+aJrHGkjjWKVXcEAvYmdz2587XBr8GXScY6ggvAaSmNJsgFuGMJ7IU3D
 RjIFjk+MzY2+Hz6rzGbx51EDC5JTyEJ9aPiV7EWo/QtL6HHBn45Z9xvhYWP9tyjBv8Dh
 0e2MS/qonViniX9rC6eedr5Xx6o+34Xys/Y3cUJOz1Pg7vZ40OYK8TOudW2Och2ZEBCF
 mcu581Myu7H4LY/QIH054ukCqgdMEg4NdXkplMbL3ieAu9OWj88fcPn1OmthGQcsKjDu BA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkd1vmrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 23:25:24 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 312MlwMf005929; Thu, 2 Feb 2023 23:25:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct59rb4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 23:25:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1sVQzfKGTw4FfksEhi+hgg2BwVHewGR1TFwJjEVRloMUxsREZ+0fZpK+bcKfwIHxZwnbto3gZGBCvlmjIINTMSf/IQpQ627lyVhCdzQPtpjhkWDYcN13dBK3m4k84oXnhgjV/yS/At3sxpi67J22FmI+1yNxpC0pWIj8GxVhLjEoWmt+OITmgqtjHZRbuYynJHfTPRGZgmgesqUwcQ96ohfYmGVgWKCRnJ+dLC1MMGgtVsGRswHtwsFbwPPI3bi5vaX+mhrhy9apX3uFCFsCHB2hBbvgwZcKVje/ifQfMejFtwwJrGx4EeE3dYkU0+BRPtp83hU4MsrDCfQw+DorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBKvKy1DqZK05wLrjQpQ0abb7ZFnZuOWGN//Wm98zFY=;
 b=dF+0ABcG1K8MEVviNaHkl6cQkOXlLdI/S9xZPwRy0yIAFrf2mHvxhVnCsvDNWB0NUx/V84zcQMVkE0BzjEaCuW5FQjyVfP+VrspBwC8Z4LMIqNx8ZKaVl8od3WRYXFMW5Gdy//GHcSNbKxT3RsMi8DVaBxtIi/js41wSw2QGVCD6prfVXJc/GfC3tExi3sXfAbUnT6kvS80zgea1jAKVQUDU6N44BZ8l56j+2QLWmgsRRerixo+iEx+/MhmOopfMsK7i56DdZ1un9upAf7UrKNqzl34OSC5/gLnD2Uc8x8GdFm+0uFnBDNa8mF0JGUV8HizcJKN9DGbKZNqBeTOaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBKvKy1DqZK05wLrjQpQ0abb7ZFnZuOWGN//Wm98zFY=;
 b=kkTgL5y16C5G3E6/V20i/z7VZ9XR67TsBtTAbOAoc9vKtAGvLPZ36uT9W/gN5zPUJ5J9Zvh13vargc2H6ywJQkQ5kbLaaFC4gCS65JBxIdQp4sQS8MZCbg4jIQYIqRqvVOI7x30E2BqaVkRV+FTzSa6KwqcdXSbSOTKmfZnDmqM=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 PH0PR10MB4536.namprd10.prod.outlook.com (2603:10b6:510:40::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.25; Thu, 2 Feb 2023 23:25:21 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::c888:aca:1eb9:ca4f]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::c888:aca:1eb9:ca4f%5]) with mapi id 15.20.6086.008; Thu, 2 Feb 2023
 23:25:21 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, torvalds@linux-foundation.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/8] Use copy_process in vhost layer
Date: Thu,  2 Feb 2023 17:25:09 -0600
Message-Id: <20230202232517.8695-1-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: CH0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:610:e6::6) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|PH0PR10MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bf791e-adb2-4c0c-9c2c-08db0574c0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E9J7pFWUJb93pFcGkalRAL65DSg95dClTk2cZXtuutgOaOPwtU6AYtlS/Os1obwq+qjx3B7hvq3wzzctaq6rWnw9U7wZ2EkZxK9qQrcJ+inqQtYRNxJ8IT2GZNdoQ49RXGvZsAXAzOHZhxg43oPIdbuMpfozGuzzb/O+jmVZo0ZvXKOXore3POPiZO8vUF1GNDBRZcUDIQqB904bjeHfgIZ06Y2fYnrXAhOWRUsNwmYiUJFd+BrBy7BCP8zsvXxD45BfWuZ/QbPEVqumNbCCdelgYAcgUx6ZvK8ExBcPDVR6lV+WaQaxChxnjDRtI/nAfur8OfzL12ORyoatlwUaalWdRbIdAdn04mZjldQ+xu/IdN7JTZMsnJJIBYSau7D+s2eg18XUXNm68P2FcxI57GJy1X060fRP8mtWF2dTfsnCnIrYaQBcCP0ZZtMVSBYGjHqgXtRLMJll6VxOXqx6riqc2EMtMoS2BLPh7xGnXWD4w8WsdMmZonG1ROFqTfty26Mu3iGmNKYZPdQrtIQxuyipP2hXXKnw3dl+L6MbLZDxNw/rcZIwMEjlUXZS9tqiDZB3xXBmz5pMrAcGIx7cZBVQyk06kBDQyLyyHHRNKxtXWS5kt3G06MJkDsTFHsvAwyx68zCCa9YN5N4ZNAnCykwGU4VCtvGRWhuMYb2ImffnDDGyFU3AKOTRmasakTFsPdBTL0BifTUeLQr0QrQoH5/1nB1Kx59Rm5i2ulBvIcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(316002)(83380400001)(6666004)(2616005)(36756003)(2906002)(66476007)(38100700002)(186003)(6506007)(66946007)(66556008)(26005)(1076003)(6512007)(966005)(6486002)(8676002)(478600001)(7416002)(41300700001)(86362001)(921005)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pX187hsjIv9BwyQs/4iiTxzqh2XS44o/9orS3ife8mHBa7LjteewRymlwNeg?=
 =?us-ascii?Q?Ehy7SwDp1FsUFg0+9L5oRoWXIvZZ8Uhz92Xuz9ZfZf2nXWmAOh8G0RoOQegk?=
 =?us-ascii?Q?j6LpQbMzW1uvEiTA1hirvxeX1nNUe8fH/GaE678bVt6xDFOXuWtZkQUgqWEP?=
 =?us-ascii?Q?1Y6MwbqKiGPQsMAsFPNZA5KJfkHvBbjYWl3aCZB5yWalGBoB1j15GOIFpLUD?=
 =?us-ascii?Q?T60M2q9icVyVX3YoSAWenObNjnheERdOIOFgsgq7L4rnSojKpy45p1NejLUX?=
 =?us-ascii?Q?MrlKOU5OAMKTn36OJug9wHjH545QkBjKfHpBSe13YBgOm3yckP/3y2zITz1Q?=
 =?us-ascii?Q?+LtaLFPRbuGPMe/7aSmppB7eLZXMMMzJabZQJtXECfdV49JsDNFuwE8bzHvO?=
 =?us-ascii?Q?o/T7cRhGMeif67pvtr+2FP5UNQktYpcgvMo9wC1g7LeingXR7inDeKSDpZdz?=
 =?us-ascii?Q?j6Wt55mh2DA9D1Yi20LJCV6csM5ptdkHdRgJ+TegLBPO31qUelWhvkIhdEGE?=
 =?us-ascii?Q?O7m5L3xB63IW1tgqFukoRxb6/qNJpn0p34rJub2W8b3FyOihh2/c0oe7boc8?=
 =?us-ascii?Q?ga8st3ZpRyWVev+Z4rYLWHCAsDlC9Viz7FjJVHav3qnOpqVUXNsql2hCRxsR?=
 =?us-ascii?Q?b4YCtdxigeaJC8y8VdO7baJqCBHKi2YdEkuBbkfF7dpNwZL24PAWf5F9ioAR?=
 =?us-ascii?Q?yS2dXppS9CpL7uulLu8FHoX/41LvQmpHrGvjUCd2gubvAGwrilFNi7v5xKVo?=
 =?us-ascii?Q?A+rujI7+qs1F0hVdUcMw6jWN655GznsFMhcrlVGFhHs0JJPyd6SWZSvN7oe/?=
 =?us-ascii?Q?IvTYnGmlDq6gz2xA4MZwhVYahOLj8nxeYJAf6vgAthJFgUoNCR4KT03Ip1FY?=
 =?us-ascii?Q?BlXj6JEZFVpri/tH2Mg9+FufCAtdiYLV9y3It/yslpAQSr15Z2aAsnv9UzON?=
 =?us-ascii?Q?lhmMocTiPmQjbVeiMEHYng3sF5JoSQmfl8WmThta4WxlUPvjB3/QLWU18aLm?=
 =?us-ascii?Q?L0H7v6X7nvcMb5/28Y5I5VQ/VAHeksHeQILwYDR0f/mK1eqU39ieBxN7XhFz?=
 =?us-ascii?Q?pPTO7pvBkWTKMQYo7NlV+1EtNkIgxDxu1i5N3ws+euS7um40pXDkL7zpE4NK?=
 =?us-ascii?Q?e1WFiyd76G7fy4Qh5SO8igjOEppJ/jp7qyO9r5tSq6qJUqD8oISvXsB5hcpP?=
 =?us-ascii?Q?/aQRlozkgmhn5wlW8oXPL3ZtEYpBOJkFcT1izX79tXRO1kcSl5Skc2aWIRzP?=
 =?us-ascii?Q?b1ISePqKbm1uX/cWBq95eigaOp3cd/t8c+00kp7OUv+PKU8Vu2ladAxR1q5J?=
 =?us-ascii?Q?ZJEeR+QzHSPIMYnlfegUYb5icW06j9p3jzT0zf90abGtALKV1Ib4Iy7BRGZR?=
 =?us-ascii?Q?E5JRy3+p3d06inWwfvH1Jf3OnHdfE0jgUmZelTlsNvN3Na1AP9PXg1HimFGW?=
 =?us-ascii?Q?VH3nqmL1tvMv77+Nba0/U12r0uUH9GFH7ZtPrH1z49o4ZFf/iMYjkcdWovy9?=
 =?us-ascii?Q?FXQxJ1MG5Mv1X2/3XAMNLo/IOzmBaEiDyvVYQRlFdO9iBuZ/xb2ZRMr27MaG?=
 =?us-ascii?Q?oUASttV44UuDTxAedwIKZlKgLKlvpvdHIrOrDEtCvsVSZysKp6ka+BqDoAJR?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?QC1VoLjQ7GgXJVBVtLRrrtX2ZfVmIzL8s/Td9oKScoZW11+BvxoWlFKK3u7/?=
 =?us-ascii?Q?pddLTDhJcFLC1+t37/FQAGYwVFbjKYV5nuixxQ0hp6O1ArMWH4Hvgh0HNey0?=
 =?us-ascii?Q?j+cctm3NXGmKTvwaFOdIKaeRQ3UdO9bfvbjh0tI2CT5kPgfpABI5kJLZOp4P?=
 =?us-ascii?Q?ppui6bcxAD9P8PX+gpssohPdeVI3iDp3CCi0hymIUq7UQklzi5Kmxp6Mcwmk?=
 =?us-ascii?Q?23eJ6qgiMoAxt2rcA0wXMOkdWk+KbsxtNWGmUTyihb+DXZwHSVN3MSJaGHwV?=
 =?us-ascii?Q?LTk5p7CSIEzDHdiXOWXEk13ah/vTgAg+bLSZD4TiqdywpBUlwo9hgryDhBU0?=
 =?us-ascii?Q?5T1J9xwQnvE8GsVG/U24lLsMuXSAwjoJwGhTzVY2PWzegXSMQI0I9Nubt3Df?=
 =?us-ascii?Q?zq4C4vK0cWv8r77+NWDRM9pEZPmoPXeKZnmKux/uyg4rldqu7mSXsMSxAww+?=
 =?us-ascii?Q?e7hbFSJ25pdhuGRGpAF5xfLHE/Q384D8Sb9IgbGsw5XyEj78m8m5O1SjFhHK?=
 =?us-ascii?Q?CiSx/W67rhXaLMZPeqiUqTkDBRZJzH3pRI4G7ZyC1bnAe5cxo921Ut9ZVmmp?=
 =?us-ascii?Q?CvjUEUTQW9/KRLzSEtvaRsKGyuHnbOA0rcrtq41UHma1vFGoxsYGEipZfcm6?=
 =?us-ascii?Q?WDCcLSl4VgtgMfMZOPnN6kwfy3NqPaXTGoTESKwATKsMMZUDbVVJxRM7KjZd?=
 =?us-ascii?Q?citQLKlELREO9wOCo3BLaPUPwaiW2i2XmfA1HoLzsAS7HsCFCKzrOYh+t3Mh?=
 =?us-ascii?Q?9qB0s3fqfLTwsc8FZpiIq7BpLASgNQVVmkilO0uek8TWUxtCEGC5zW4BusRI?=
 =?us-ascii?Q?aoDME5R9/PfPamCSJ5TbphF2TzeoHlv5XPYG4bpnr2Sm5RLNoVw9YXUL0Zkl?=
 =?us-ascii?Q?RNTFIFZFCKRXLsPHPOrIkwPHz2922to+pJha28xg0I2417HFNjqdwUGQChcr?=
 =?us-ascii?Q?cxCqCMChfvbBGSoKPAThANVSjc2VQlQ/0zeR0/L3rX15DtTQ6jV6lcnyWTyI?=
 =?us-ascii?Q?H9zYqGVkLoh80LAnKVnPPc9tUg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bf791e-adb2-4c0c-9c2c-08db0574c0ad
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 23:25:21.2661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYjOH8SdqDThn2D75F0AANPQ436tMeBk8oUOySGJjUNBADarB8LZn3RZpFE0K6rGiTIbFdYubwY/dJzM/G6pS9UOvcLWv9p711z1fFa0ZR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=580
 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020207
X-Proofpoint-GUID: yN1DTqHFsBDkrGX5kbldubH3J40Cv9ms
X-Proofpoint-ORIG-GUID: yN1DTqHFsBDkrGX5kbldubH3J40Cv9ms
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The following patches were made over Linus's tree. They allow the vhost
layer to use copy_process instead of using workqueue_structs to create
worker threads for VM's devices.

Eric, the vhost maintainer, Michael Tsirkin has ACK'd the patches, so
we are just waiting on you. I haven't got any more comments after several
postings, and the last reply from you was a year ago on Jan 8th *2022*.
Are you ok with these patches and can we merge them?

Details:
Qemu will create vhost devices in the kernel which perform network or SCSI,
IO and perform management operations from worker threads created with the
kthread API. Because the kthread API does a copy_process on the kthreadd
thread, the vhost layer has to use kthread_use_mm to access the Qemu
thread's memory and cgroup_attach_task_all to add itself to the Qemu
thread's cgroups.

The patches allow the vhost layer to do a copy_process from the thread that
does the VHOST_SET_OWNER ioctl like how io_uring does a copy_process against
its userspace thread. This allows the vhost layer's worker threads to inherit
cgroups, namespaces, address space, etc. This worker thread will also be
accounted for against that owner/parent process's RLIMIT_NPROC limit which
will prevent malicious users from creating VMs with almost unlimited threads
when these patches are used:

https://lore.kernel.org/all/20211207025117.23551-1-michael.christie@oracle.com/

which allow us to create a worker thread per N virtqueues.

V11:
- Rebase.
V10:
- Eric's cleanup patches and my vhost flush cleanup patches are merged
upstream, so rebase against Linus's tree which has everything.
V9:
- Rebase against Eric's kthread-cleanups-for-v5.19 branch. Drop patches
no longer needed due to kernel clone arg and pf io worker patches in that
branch.
V8:
- Fix kzalloc GFP use.
- Fix email subject version number.
V7:
- Drop generic user_worker_* helpers and replace with vhost_task specific
  ones.
- Drop autoreap patch. Use kernel_wait4 instead.
- Fix issue where vhost.ko could be removed while the worker function is
  still running.
V6:
- Rename kernel_worker to user_worker and fix prefixes.
- Add better patch descriptions.
V5:
- Handle kbuild errors by building patchset against current kernel that
  has all deps merged. Also add patch to remove create_io_thread code as
  it's not used anymore.
- Rebase patchset against current kernel and handle a new vm PF_IO_WORKER
  case added in 5.16-rc1.
- Add PF_USER_WORKER flag so we can check it later after the initial
  thread creation for the wake up, vm and singal cses.
- Added patch to auto reap the worker thread.
V4:
- Drop NO_SIG patch and replaced with Christian's SIG_IGN patch.
- Merged Christian's kernel_worker_flags_valid helpers into patch 5 that
  added the new kernel worker functions.
- Fixed extra "i" issue.
- Added PF_USER_WORKER flag and added check that kernel_worker_start users
  had that flag set. Also dropped patches that passed worker flags to
  copy_thread and replaced with PF_USER_WORKER check.
V3:
- Add parentheses in p->flag and work_flags check in copy_thread.
- Fix check in arm/arm64 which was doing the reverse of other archs
  where it did likely(!flags) instead of unlikely(flags).
V2:
- Rename kernel_copy_process to kernel_worker.




_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
