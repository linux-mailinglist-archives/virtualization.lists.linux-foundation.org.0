Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E239081D
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 19:47:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1123A60B26;
	Tue, 25 May 2021 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6fvDFyxta4B; Tue, 25 May 2021 17:47:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD07A60B33;
	Tue, 25 May 2021 17:47:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00F2BC0024;
	Tue, 25 May 2021 17:47:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F172AC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0E4360B21
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOuAMEi9Thnm
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15B7060B22
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 17:47:49 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PHjWpn038782;
 Tue, 25 May 2021 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=MMy8XfGqa1jo1IGihoCzolz6QLgVXyfM0Xd3Q9nmhaE=;
 b=D8XEuTUCU3eNzhNRhz4ePgX7RNoiwBZ7ux/mR1NIeLIF/Mo3uWgsjAUPPUpmKFJPid/Y
 e+71TJtALiyPQ2QYzBcV1yixkrix46ETUsk/axlSY55e2+S9BvO+IoPXoPD+sisZUBuo
 V6d+KIMQgFKK3JYQCpvvmbU3ekhNUiMB13CpdYiP0sdnno7NaI6rlkSpS86UsYBm3yk5
 9ARFJFozxtaQW+ObWoChMkTLPa8jXPlLujVfa9dgVvXoRHVwfUg9R9XVFynZkaK0miSY
 LxU/t5KyZemQwRQ9H98vfUiljgmyAv5Q7YKl4Ardo1YVsFE3FjqP3QRvw2bHp4SP/kY5 QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 38ptkp6ta8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 17:47:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PHeDnJ133298;
 Tue, 25 May 2021 17:47:48 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by userp3020.oracle.com with ESMTP id 38qbqsfu7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 17:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVK+Ib0P1f0Q2hu8TecUt1edajYx9WHkpT99Qe48mte6cxla2wnt6iGYaB+Zcp3dnsbNKd7ww6MT5ZBU1tPlGggPK7JVs7A/PFzQQrqHYCCU2JwTV7y+jiizl7fP18963JHydQy3RIQLwIvXE47k4KNbQek61FJ+FIzC6t9oDxOVFYajqVy/RdsMbh0PyNUMcLyFXWccLQhuoLNIEFGytn7oE00goV4n+0J+WBMBW/N4ZrA9ueZsQqQx7mpPW3a8Y0e/zmfMoKTMRKTCOxNkA3+XDJu7qNjNG9b5XBvfcQ06awB/wW5ayWy6/IO6H1IU8g0RQHwik59caw2fXg1Jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMy8XfGqa1jo1IGihoCzolz6QLgVXyfM0Xd3Q9nmhaE=;
 b=XY7axo2dUxTGTj/YrzIIGNeaCo5i8Z2dDvPw/BOyB0e8icp4knsSRUMnlHZnxq7J+Mq4JsW/sQP8EoLJAfaQGbi0Dm2/7sSq2eD1Dgu8bE1tSj/1aY5BCAAzULIdL6CfrejdyyJ3PjEDcIkeP6pS4RjM9CXtDZ94K8GBHlp+Sewx9fGtWP2vM2Ys4wpNIcTVrthDhfbirsY/yuE5Ql/M30nKMyb53HRAKDxGRpCK5SCvFgf05PfEXvkw2+8neYaTY6ib32RBI0Gss/EgfHmF+iwfQhSw0TIhS2Q3WB4iRx3ZGpP3feZBaIHxuSRPcOKQ3cjvJsR9wBlF8GcLdRc3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMy8XfGqa1jo1IGihoCzolz6QLgVXyfM0Xd3Q9nmhaE=;
 b=uH6Kz3UcbnyUeXk4oc3ZBMz1kg2jsdvzaMte9CtqKUSEk1KnljJhYKBV5bRCEzhBQvS41y8yqVGDNrKmGMYYAUu4N2kXye3o8gMcYWzbH+7be8NOL8+tKyai6zO0fcuqw/3Tq4hvOKVFo2HvfEPOdAoFUw6NvcLWxKnkq7VQNkU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from BYAPR10MB3573.namprd10.prod.outlook.com (2603:10b6:a03:11e::32)
 by SJ0PR10MB4720.namprd10.prod.outlook.com (2603:10b6:a03:2d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 17:47:46 +0000
Received: from BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0]) by BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0%7]) with mapi id 15.20.4173.020; Tue, 25 May 2021
 17:47:46 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 3/5] vhost-scsi: reduce flushes during endpoint clearing
Date: Tue, 25 May 2021 12:47:31 -0500
Message-Id: <20210525174733.6212-4-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525174733.6212-1-michael.christie@oracle.com>
References: <20210525174733.6212-1-michael.christie@oracle.com>
X-Originating-IP: [73.88.28.6]
X-ClientProxiedBy: DM5PR19CA0009.namprd19.prod.outlook.com
 (2603:10b6:3:151::19) To BYAPR10MB3573.namprd10.prod.outlook.com
 (2603:10b6:a03:11e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.88.28.6) by
 DM5PR19CA0009.namprd19.prod.outlook.com (2603:10b6:3:151::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 17:47:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e575ed1-5907-48c3-6070-08d91fa53467
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4720BE20E734C6BCC071AF50F1259@SJ0PR10MB4720.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ScSYMiCxfnK/LlTAOZpFVMVwSacesUBEqTr+wLCguLDRmLSYyw5ve9LL020Tw5OUgoOWAosMv9c0w/nKwm9WpSsaSV+uzNAowh48wGaB+9PDrsvZ29DdYUo/8O0uU2RGzmi45WPXC4WW/mSQuNydtOqfMfdgmB/UgNInT2bPSDizkBsXIZkv0Ga8sL55o+78lj3wk2VJNP2fQ0I242W4K0W+BotxyhbhJTYvTBjg9WFDeiROZByUurT3dgbla3a97cuk0RBa6pF/AMgBLLFm++Xe5wXbo2U7w5AThvjcJe+MrWO9bAJDPKiHJ5aWR1X0Z+Xeab2G/VnV4n1xaDmJQUKy0wN2q6TWOXw4sq2ZSn6ZhxlA1h1WdRzpxGgJG0tWgrAqjOHQTUd+HvS71jTpk91B5TGrt/q1q5kk4YMvpy32JMMFTPZBwQGVvAN10ebdM9NnSk7N2/56mGbQdYSYJVAiySIZau/CuRDgTNGgDGN0Q6s8TyCDbz7yVnzD7m3oJBs6xrFacK7meWDrXKIwhuR12gown90DDT5WBEAT35pzVIXyzqdgwtCA9+ec4PgN7G/LpqtFsCxIWvx7SC5EbmGwjQZsmjZfr67wry/kQe6/p2MvRiCjH+dJd4lJuRZRInfH5Rk9SrGz2kUd42bd1R35F9VJLmYf5y7IF2EUvaNUeEeIvX80lRTlDgLmT62J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3573.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(366004)(346002)(396003)(36756003)(83380400001)(6512007)(107886003)(38100700002)(52116002)(26005)(66476007)(478600001)(38350700002)(86362001)(66946007)(5660300002)(66556008)(316002)(8676002)(2906002)(6506007)(1076003)(8936002)(16526019)(186003)(6486002)(4326008)(6666004)(2616005)(956004)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2pyVwmv3+/6rxdu2L9oN7DEztqJltcC3Dgttp84ss+tMslQ/uf+GgG2xBywn?=
 =?us-ascii?Q?WhKgulkAbHwNT7O6Lro37IntRCANk0BlQbxmCiDlaMMPFPhG5xUTo9Zqq3e+?=
 =?us-ascii?Q?Rv6Jf7AU44ievcqipm+6ajlDxOKZ0m6XpbDRwTfUrXUN/2j/2gtnOsnkChTC?=
 =?us-ascii?Q?OZWpcJjZelvTzf8tA1Bbns4J0ihtbL3LMFyGCTXd1+tcwKFc/qdXauF2f7cL?=
 =?us-ascii?Q?480nFKqafb1xDXXMzmXJ+zjuy6hJSO5u5WBW26dQEP1AJycrZQBuNTW0YLFt?=
 =?us-ascii?Q?qC0sKpHakalAyEflMWfmudysb3BB1M9HfeUYn2HG+gouAeUXW5cWt3N8LMlW?=
 =?us-ascii?Q?cGiu69i7zw2kT7dYgcd2zEK1/sVcj1IaFY3+95U2fPBF7naIt4cl9boIupbt?=
 =?us-ascii?Q?wEbAd+eFPXquvTSa0XLhvlpwC64ddE/a+kOVSpUoCXLoGzLAB1ZraEWUYNeD?=
 =?us-ascii?Q?z2keOJ2HTbg36crIQAl40VLWbChbPezv8GepooSC2q7axfk39tluyatQrtPc?=
 =?us-ascii?Q?DYqk89jPI9s6bkyzx5m+hRSvox6L+IVj6sILNUlwEjlHVcpnJPAE92uEiW44?=
 =?us-ascii?Q?Mb+i3KoN2UuGvEW2iHUlmKOr85NQvzlqDM2070A2U/dJ5IFf3jMpI6y/tm/8?=
 =?us-ascii?Q?CRSb96/XaBlFwlD0pA7KB9p3G6yflkN44c6jX2BWrUNNgQQ+Uts3ZQ74G4AS?=
 =?us-ascii?Q?Q6aSDkWiXKzrP7rJ3FnBB+piy0FcvhLeF1hYvemfxzUro7mc5MjqgLINcnVs?=
 =?us-ascii?Q?J57Nw3lbIj//D8UW4PBgtTuun+PqH2zCm7eSDmZ03dtOi4OlDKIWvZKDLLnF?=
 =?us-ascii?Q?KzORxIAVeHR16ZEOMEmybLT1zp9G/bl8cjaTbVHg5mDV4E3Rv2JgK+hK+CRL?=
 =?us-ascii?Q?mmiqRZ5PNznWkqgskAeQYlxk9TpdP353LgY9lna0FyG2pzkr4/RwuQE4zFvY?=
 =?us-ascii?Q?36gJcWS3+SV1tXPdPnqlZJgc38igFN/oviGHR/9g5JAQT3qVgLh0xLzo5j0X?=
 =?us-ascii?Q?BQI1ncHp/+trs8UbEcZkeFdBXsaLNaO2F06xX8UbGhblxaFaG05Ilv0MNEQZ?=
 =?us-ascii?Q?gvCAp8BQEtAht//9/hiEgjCN9qM4O0fUSloGQGUlGCItXhgdfLZ97RXWCiml?=
 =?us-ascii?Q?3YMHvNoDzXBjnhAkew/o9kBFrbN7DnGpYegnQT96NTxku4/MlL1R2JzmszOB?=
 =?us-ascii?Q?3jmdH11FWgXog9y/4KtTaJEhlvykbSDND90bDKCKLk4SRoIpFNJ9wvJ703qF?=
 =?us-ascii?Q?YcEHsHU9PO/6tw0uv84kMTXGZw5LoKtJSpcmDew6Cyf+EJdOlT616C3o0crV?=
 =?us-ascii?Q?mwUtFHZqZ873NhVfU5XaY/7y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e575ed1-5907-48c3-6070-08d91fa53467
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3573.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 17:47:46.0759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +exe08fp4q1OsEGqBMWEqE/QVMqj2lTfZKWZZkl5oKgHFuU1nnSH6jfnJxElCUyjfk12gSxJWhNHrd9BEPJ7gcaZZ7nkDSS4PU63OyQ1/7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4720
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250109
X-Proofpoint-GUID: KQ1AnMHLe86thmUSfQRTc4Q2Fc396LI6
X-Proofpoint-ORIG-GUID: KQ1AnMHLe86thmUSfQRTc4Q2Fc396LI6
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250109
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

vhost_scsi_flush will flush everything, so we can clear the backends then
flush, then destroy. We don't need to flush before each vq destruction
because after the flush we will have made sure there can be no new cmds
started and there are no running cmds.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 2f9633ef26aa..927ebc52d822 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1747,11 +1747,12 @@ vhost_scsi_clear_endpoint(struct vhost_scsi *vs,
 			mutex_lock(&vq->mutex);
 			vhost_vq_set_backend(vq, NULL);
 			mutex_unlock(&vq->mutex);
-			/*
-			 * Make sure cmds are not running before tearing them
-			 * down.
-			 */
-			vhost_scsi_flush(vs);
+		}
+		/* Make sure cmds are not running before tearing them down. */
+		vhost_scsi_flush(vs);
+
+		for (i = 0; i < VHOST_SCSI_MAX_VQ; i++) {
+			vq = &vs->vqs[i].vq;
 			vhost_scsi_destroy_vq_cmds(vq);
 		}
 	}
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
