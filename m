Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD01550E57
	for <lists.virtualization@lfdr.de>; Mon, 20 Jun 2022 03:14:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9B3260ED6;
	Mon, 20 Jun 2022 01:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B3260ED6
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xLAtQNfd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gHfe8xnN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_sdBcXSUVD5; Mon, 20 Jun 2022 01:14:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 48A0E60ED2;
	Mon, 20 Jun 2022 01:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A0E60ED2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A2A4C0084;
	Mon, 20 Jun 2022 01:14:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E992EC0088
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C20D140A2B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C20D140A2B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xLAtQNfd; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=gHfe8xnN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nM6_Is1eQh0t
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8AFB400CE
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8AFB400CE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 01:14:31 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25JH6TuP030122;
 Mon, 20 Jun 2022 01:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=6/iIQ97akuse4EJmbn8sqSbLLvmlhDQsXhvPgbAh36M=;
 b=xLAtQNfd5FWr768q2zXMlMtoFrUWp7lkLhPD2zM0RCaTy+XDf0swOkTmDkdAL8+Ra0tK
 imw+PN8tDgKkKs6KC7SfNIHcxm2LetOEU5WRSl9MJhU/jR1F5QXo5Wh9T4duSg4CRZKN
 EmMNvihUnM8R+OsrUmeyLsEJLUbQhsCYMq6rK3afloRQ/8aHt3FE43jdr/fQg7E6OYws
 JRWONFI3bMQtRJ8zZUi/8ZAqa34lxTzQ4oPLkeY9uuzDCclMVQDDAirvQpEQ5u4CrAQ6
 pKlsL6naDRYrTT+AhpbWesZ3Mkj/9ftoeKXqYLulw3MoV7I4ZnfRaVJi5oBJaZo7hnlN XA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6ast048-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 01:14:14 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25K1A3RY038698; Mon, 20 Jun 2022 01:14:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtbu5tbf4-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 01:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2+j/FieIcjWZeFecb0vlPejfMHDrlF6nCUT084k4Y/tfKOG15eVd2YFI25ZwE688nQzEpF+1hs+nTaxRRdwTYvbIU/fHqcfxwnY3ZMPfOvmzNi/J3vtiHSDqG8+EZndoY5RuoI8nmTVI4ClKdpxugnPExVEr05SxwhAfm2exp2Z3atZdPqvdKPfA1RacxYmJ67qH6EbFV+ZGn1CNKVvZ8n6elbBKRT8Nj6So14h5M5tIO6VMl166H5bEJXpa/eYpDf0LtDXA0Dx1KIJWlQitIgEuT8jcVMgM7AEttHvwSQ9nU2j7UA/8TE8kM5KkzvcmdiA9xDA8a3DDqcovf9sKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/iIQ97akuse4EJmbn8sqSbLLvmlhDQsXhvPgbAh36M=;
 b=FUlzypVOOiccY+2Lgvf5ERq/X2f2qg9C3GjZshnjloeITfXoce9mAus2rty8aFIzKhFXc6wuBeZ9xrUSiIZR5xL8ipkgty7HgB4jxPsfzEl2fBZQjZpLAOEGk4GOuWRrMR7wduDBVhOH1rMc1vDwYddByzJDBW5fKmGou4JHPAkaziRRZpbdb77U6qwxBSe7ARXZCUrRseVOQLTbcy78rTgj74brSqVMQY4we4Q1hFpP3dX+VTW5M0P4M/elQ1lxCG+l1fMQRrwTRBDR4t/UBhU5XhxFi1vSnYztF7c3poVbJN+D/kfRjPrqtZoTwv/HQdvPO9VDv1IXcms/K9lGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/iIQ97akuse4EJmbn8sqSbLLvmlhDQsXhvPgbAh36M=;
 b=gHfe8xnNOSocmjkRardeOfbVM9sH1/14QmA3yMY6Tiw4TlsAyyLGGDnH7y0CvG0fMM1YC+dD4tNGDWqZJ7HA0BkpCN9kajpuQjp6k2D0gTudhwBC4S5aA6JCGmX5DKK8mJTLvtdB82/LE1ay69b15nQS0f5lLXQTaFfwZWQh9Jk=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.18; Mon, 20 Jun 2022 01:14:07 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b%3]) with mapi id 15.20.5353.018; Mon, 20 Jun 2022
 01:14:07 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/8] fork/vm: Move common PF_IO_WORKER behavior to new flag
Date: Sun, 19 Jun 2022 20:13:51 -0500
Message-Id: <20220620011357.10646-3-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620011357.10646-1-michael.christie@oracle.com>
References: <20220620011357.10646-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM6PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:5:bc::27) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9b2048f-d58e-4898-3a7b-08da525a2c28
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1466BC623B9DE954C0AECF1AF1B09@DM5PR10MB1466.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bA+wAWecYyxhPO45NgmaUxA9Qaw0wcsxDZBhE7wpfT7XFFMgcgttsYwX84Kaqt2x3RYG8WngczcR/rpRAA+V1hDdiR7ET5lfBLTWIwq7H54NVeSf9jww0OpuTgKrArwL1WT8nSAJwBJJZmq5M779b4goTNk6iY2M8WhaOG2e8lkVy2Q33upUlIMTaG2lmHzZE19TFvtiFIqwhh6q9hspThB59I2CaZXlckryISUHnv9QAOckrDMxlGKL+tBc8Cbxn0CjNsR5s/OfmqD/uE+IwcyDSGlqkirSerEKMoiYSIOOOxv6UA+OHsWuWArjRGjIPprp2j0F5jNuhcrEm54yXzePf5uC5WKFAkXy27o1lq+ZfNJs8QW7u/jykjyJa/oseqmFc16/WaPMPV+FFAc9kPZ2EMz/tUYcTQ/cPjYUjj7F7XkuPXfSrZGWDYx+Jll9bVWHuF2+VOaHv9D73yky750SdqXEVr5bs5NaxX5o3DAIGvdaRwQLVESZYXuUANQM0IcA/ckD01teRKBK1bfOQ7M2v7sHf1LUWdm9aR3PxPem5EFwExBsPycAj3yv/pvAxb4DNo9HTzyRglQnXSfxTRcvFDfY1UWJlCy7tkBnq4+6npAbhOSTjC0VBRRYDV1jGgytsG85qBHEJ95i4SSYwTAHL9kIdzC8I3wGUv4OOmU+KN31fQ9abVa2k8zIHnTBRrWMfdA86B1KH5BZ2wKD/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(316002)(6486002)(6512007)(26005)(38100700002)(8936002)(38350700002)(5660300002)(83380400001)(6506007)(2616005)(8676002)(107886003)(36756003)(4326008)(52116002)(66556008)(498600001)(66476007)(66946007)(86362001)(1076003)(2906002)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4D2/6Muc6qz14E2uZE1mktqlHGVRTlU+oH9gMFqEiDAcpOeJnrtq0EQdm1fK?=
 =?us-ascii?Q?aLzDkaGoAdVJGYqDFqsI3HB0yGR8QrokoJSWCYVLegl+oGZPSqoqXNBeG4YC?=
 =?us-ascii?Q?mHc6YXtLNlARsHl9pyrqodH6NK5ioL4hMsmGsCJUv381yar5TOLvOMi/F8rH?=
 =?us-ascii?Q?e43AlmE07nBQ19BqdT/YWfZXCcEo2Khj5LZfAdfTrVfbObOYuxl2uthrJ7Z4?=
 =?us-ascii?Q?c0hXmUG3mpDCbeykvH5tgP1wm0goTPSob61Y0yQbfHCh6aEjnb5uJI8VW4iP?=
 =?us-ascii?Q?ZFntralY7M4GitDZVU6Km04xcnFMKkv+BRldA09Q4x4iii32slJWpVaQAiae?=
 =?us-ascii?Q?Q97PJB5NNWiemOxkFa5SzCfnYQfjHuQTRiQDNziTMIFE3pLDC6ftYKSNQ62u?=
 =?us-ascii?Q?jsoRjRU5INNfQbjGv8ABJp/0vQ/fUD/vCgTip0JtSRZ0t8Ggly9oBEkdOxz0?=
 =?us-ascii?Q?hhTaoRMnWBr5C/zBpJbQeKlKwdJmNeJ4/jwUhr36gdKUqvEHmmCzUQQIKyDs?=
 =?us-ascii?Q?LgbbA6InPLlAbRmpwoleLkwd3IPZCnu9TsRRpMAbWRRAlSAHHHO8TPEoM680?=
 =?us-ascii?Q?EhG35loSuyaAtw1a5NLkzZPjYC3IzKUJtMKC33DKS4bZ5X1lQ21LDO0oi7LU?=
 =?us-ascii?Q?E+vXCBawbUVvNuGYv+DG3kzw4LK4Ka+1w3e5qIp7AynaK/kdQ2/HYKIiEade?=
 =?us-ascii?Q?RQMXG3zjDUDhVZycf2/elfH4p6H3QWshTsFHRiIm5/D0kgavNPVW2PKP0Eq+?=
 =?us-ascii?Q?YjdXFvyIXDcYax7tgRi25ixFk8eCGCj2xtsBwvHvvv/nCdFZXFUc9TWpBIRA?=
 =?us-ascii?Q?aWnkYvlzihbSiVQpcyoJp9s9hY9AOZ+uNYv0Kq7vclvYdriFCu9JoM7U58lD?=
 =?us-ascii?Q?Ii8h3HrRXVS5wWz+stN/ZuZXKZUtjWDN+/d3fVO+i4BhPem1HxxpL255d69a?=
 =?us-ascii?Q?EJ3CMNB6HBqwjUMddcGTA0d3B6PnZJKzP7Vm7tzqnFNKwktuBjAw5P8OerFk?=
 =?us-ascii?Q?kGX+45eCnegj7Xmz7baxUefiUdNRLMPc0IhRiLlo5iw2aYUz5aOLRdCJnjBH?=
 =?us-ascii?Q?gIFMpRqk14k3VDz1Zm1jpkbP4cx772aWlM9rFsr6oLF43/x9EoM6sgwR1phk?=
 =?us-ascii?Q?UYZ2/duCBkRFifAiy2u9Y+Z3zuV0zm08J8DMepxsyzOL7W77XLAhfnoqGny3?=
 =?us-ascii?Q?ONWOkLFB2vehTFQrUKRVTQ8GWIyOxjaXQIfE1Zki/m7in5R7MxFDfttxlrtc?=
 =?us-ascii?Q?TsoCQSwrLZDvxiAKrhS+9bHaMRoi0oODmVC/0+hCy7xZNGJoSi1iLcB9Munw?=
 =?us-ascii?Q?CCyvQM/jzQhaamyp+cQcPh0pPNzzVWnxSoQYyq0foNP1ed07uPanCLOrdVi+?=
 =?us-ascii?Q?a73TPEmoIy0Wyj3TeyllJ6Uk4ZsKTy/+w2IejdN1CFSht5lJRaiOpS60r62V?=
 =?us-ascii?Q?vRUOyRLEe5tsxGOf9vm7L1aluk/TD2LBFwG3RbN2IHXkUTaQJpwxj+U9zqDX?=
 =?us-ascii?Q?sGV10frtv4nEJEQ99f8hyhaQQhWMKj1VZBrthwDavSfQ1nPAxObJjSjJvKrT?=
 =?us-ascii?Q?Ll7a55KVGzdRhYI725BAvN/IEQ949XYIt1R9pYtLDyqp0T0YkOTUSmt8aAYV?=
 =?us-ascii?Q?gTyaye2+AXSA4EZ8ZpUubohq7bSCSpqtXXEz1LgXUNRs+ytKLo5mR+Pxr5ha?=
 =?us-ascii?Q?vpcCbJY620pshvGAL0x1JXpJ7i11WfaBWTxvOkkAWTEgJ4x3Vcft4YM8QkRa?=
 =?us-ascii?Q?ipyp0XFr3yE92ppbeP2JLa4ugoZVvoY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b2048f-d58e-4898-3a7b-08da525a2c28
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 01:14:06.9433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCpsKHrCnA0zFwVV3sk6jfFkAJnxw1fIGIO/nXiG0+K20kD0Y+fJkUzeMgehc/LYtdZdicDbOpZ+gcC25VK8FTEGKOsyxw7+1WMsIS2DkR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1466
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-19_12:2022-06-17,
 2022-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206200004
X-Proofpoint-ORIG-GUID: ez-tNgAa_x1YxVB3b2LdxdCSHElmsmCI
X-Proofpoint-GUID: ez-tNgAa_x1YxVB3b2LdxdCSHElmsmCI
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

This adds a new flag, PF_USER_WORKER, that's used for behavior common to
to both PF_IO_WORKER and users like vhost which will use a new helper
instead of create_io_thread because they require different behavior for
operations like signal handling.

The common behavior PF_USER_WORKER covers is the vm reclaim handling.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/sched.h      | 1 +
 include/linux/sched/task.h | 3 ++-
 kernel/fork.c              | 4 ++++
 mm/vmscan.c                | 4 ++--
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index c46f3a63b758..d7cd2037430b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1701,6 +1701,7 @@ extern struct pid *cad_pid;
 #define PF_MEMALLOC		0x00000800	/* Allocating memory */
 #define PF_NPROC_EXCEEDED	0x00001000	/* set_user() noticed that RLIMIT_NPROC was exceeded */
 #define PF_USED_MATH		0x00002000	/* If unset the fpu must be initialized before use */
+#define PF_USER_WORKER		0x00004000	/* Kernel thread cloned from userspace thread */
 #define PF_NOFREEZE		0x00008000	/* This thread should not be frozen */
 #define PF_FROZEN		0x00010000	/* Frozen for system suspend */
 #define PF_KSWAPD		0x00020000	/* I am kswapd */
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index b0a9d6c75bcc..9e20fa18c41f 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -18,7 +18,8 @@ struct css_set;
 /* All the bits taken by the old clone syscall. */
 #define CLONE_LEGACY_FLAGS 0xffffffffULL
 
-#define USER_WORKER_IO		BIT(0)
+#define USER_WORKER		BIT(0)
+#define USER_WORKER_IO		BIT(1)
 
 struct kernel_clone_args {
 	u64 flags;
diff --git a/kernel/fork.c b/kernel/fork.c
index 49fedb79925b..604c7f3cdde8 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2074,6 +2074,10 @@ static __latent_entropy struct task_struct *copy_process(
 	p->flags &= ~PF_KTHREAD;
 	if (args->kthread)
 		p->flags |= PF_KTHREAD;
+
+	if (args->worker_flags & USER_WORKER)
+		p->flags |= PF_USER_WORKER;
+
 	if (args->worker_flags & USER_WORKER_IO) {
 		/*
 		 * Mark us an IO worker, and block any signal that isn't
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f7d9a683e3a7..6d771d8a3a4a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1047,12 +1047,12 @@ void reclaim_throttle(pg_data_t *pgdat, enum vmscan_throttle_state reason)
 	DEFINE_WAIT(wait);
 
 	/*
-	 * Do not throttle IO workers, kthreads other than kswapd or
+	 * Do not throttle user workers, kthreads other than kswapd or
 	 * workqueues. They may be required for reclaim to make
 	 * forward progress (e.g. journalling workqueues or kthreads).
 	 */
 	if (!current_is_kswapd() &&
-	    current->flags & (PF_IO_WORKER|PF_KTHREAD)) {
+	    current->flags & (PF_USER_WORKER|PF_KTHREAD)) {
 		cond_resched();
 		return;
 	}
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
