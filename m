Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7E7CE427
	for <lists.virtualization@lfdr.de>; Wed, 18 Oct 2023 19:16:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F90A6F531;
	Wed, 18 Oct 2023 17:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F90A6F531
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IrmamJsF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtMq2a-A9JOx; Wed, 18 Oct 2023 17:16:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 30CB86F52D;
	Wed, 18 Oct 2023 17:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30CB86F52D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B66FC008C;
	Wed, 18 Oct 2023 17:16:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA6EEC0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 17:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BD4882CCA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 17:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD4882CCA
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=IrmamJsF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unzm4yLbUf3t
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 17:16:25 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7533382F6F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 17:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7533382F6F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsyAf+op9S9BBb9bqex+8v6EERwV5yXMgWErn813SY5rDY768Q/YM8dytFvW9mGPnswqe8Ic7DstwJ2SNHO/JK/TrkswYLxdlA/v1kOyBB9poKXSRSrq9/DPk4E4CV1S/nFgD4onFR+A6LKIrQZ76mmbEelXKJ+wrXdFJ4VMdFX0K33hEAWyhsEwsAwkElmC5GbE6cYGiCDzDALUEM5g8avLss5xZeFIaOxc4rIzzaXJU94qkOyqXe3lXQWOeSct6CZ3TDepHicvE3v+u+K3Okw87ZSFuS6GG/a+8VXaSRNMi/6+iBLgD0vNKfYAr9UqgzKTpzD3YoJDfV3agxpAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+yKp2e1QHrSlE2/K+1Q9nARtdxnRNsDTO9eHQUcPRA=;
 b=AmRcUJYc8JAEhUhTsl8A49UVaSvInguozEh3CGGwdvr+tFGDaUWHn97OoRvZAthNLXbQmDFHdW91X2OSv9eLrJ9C/Twe52RyFvaamrzj4Wa5hz3Tb33bAbjIBlg5uOyg2seK75pRmdlkrdBm8XhLmsSQrkJufhXOD3EbuCG6qZaa17QB/j2B7jtUO2k80WoO8+094hK8PF4JuzkeCLvZ16a8cg9SwHt55m8iq1hYb6EwpWUao8hyyX19FgPw6TZpiLQktLkryUrDU11kZ2OXRckEnjK4gm+UxJrd2t5F2mTiyxAeyNoxYTwFsTvDVU5EIxFdrmVJaEcYL6J6SwWVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+yKp2e1QHrSlE2/K+1Q9nARtdxnRNsDTO9eHQUcPRA=;
 b=IrmamJsFjnIQg7D62DgfvfluJVuD7b+TwKTQSC/DgE+0aSJvVrhXn8WaH4LwH2pPIhRT83C5EJQO7OnPaBuo2vIK3/T+8RrbdR3LJz+oHn1xeIttx+9vvA10bW/ej94zUNAbWPnAmu1q9wSmQhLOVdSjja3GznBgNrJFrshUYy9tjVy1s++WIhEKSYKmjDKFlwBoHnD535fyfSWMjDQhHgznp3+L+WGj9CCi362e0P6tqrSMU1SbODseJ54YVj/aro8wcPPmb2O1tY1PgVAYnGvObc6uOo4Y+B1ab+95nibIM6PiwOjXvbsbfHZgh38h9WJ81FYJHFpWbaf21BOonQ==
Received: from CY8P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::15)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 17:16:23 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:47:cafe::25) by CY8P220CA0034.outlook.office365.com
 (2603:10b6:930:47::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Wed, 18 Oct 2023 17:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.22 via Frontend Transport; Wed, 18 Oct 2023 17:16:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 18 Oct
 2023 10:16:09 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 18 Oct
 2023 10:16:08 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.986.41 via
 Frontend Transport; Wed, 18 Oct 2023 10:16:05 -0700
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Eugenio Perez Martin <eperezma@redhat.com>, Si-Wei Liu
 <si-wei.liu@oracle.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH vhost v4 12/16] vdpa/mlx5: Improve mr update flow
Date: Wed, 18 Oct 2023 20:14:51 +0300
Message-ID: <20231018171456.1624030-14-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018171456.1624030-2-dtatulea@nvidia.com>
References: <20231018171456.1624030-2-dtatulea@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 34232203-ccbe-4cb1-fa0f-08dbcffdf3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUPA8LAZ+cXKhaCogU8k1Wwz3OSZYsXwpY/39z0byjSt0VDW/Km+ILR1RjL1UyTerXGBLBt1Nz35wZudSBdwPtQIVuKa8k/UPWusdtujMb5l1FtEM0uGg5V3Xz9fWjb2UOHjoGmf3i+LCZ/WSizclzrIvX1LPlmg+2PIrHv7ghc8vjk0VYZfrF7qab2omxFwHd2PcYYuUi7yEkU4kHsGyy30zl0yhTaTAN4QTvYtgvKSazYrgoWWjm/wr80JQTY4GOLt62Io6nIbgeLleewt/lwKAhLzuTc9Jllo6v5bSMq9jZXQneGuyWS/ADOA9wR2FyZLcz2q23adDG73rKW/kroRUMfeXTWrw0ECnu1G4Ls68ECorWqj7+z9FRhaw6q/ms59gw8WORXbfG1i9vl0h4t476DDp3rGQCY2dG+SNTIhUCXJ+sjXHljQgnSw+IVaC8gC72wFurr8LKC6e2OAkAXAACNJtG8pKe8TPO4vcLvHjTqWMVlIrYnjG/tEg0tih+un/bLYZtE9KUazRE0xJHVEhXDNbB6tQ9LjwghcBstMMMsPxywGMoYklF7nRZV37FEJaniby8jEbvSdN9rqGUmfQABeFRHmF49nA+R1AdMzut22W7QAmRVFXdC2ToPIC4MQo2RCTivI6jiE0+e2yt9U3cK0NTa9bts4zakruc1j/BqceUbcDyqF1o8nwCiKFSmKGSaP50mD4N+vbIq593nEdMWRuqPwapNN/LoR874Te8UVqjfmrihS311ygSt7MYxl4KcjFXhJ5j3h41q6Bg==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(70206006)(6666004)(70586007)(54906003)(110136005)(478600001)(83380400001)(36860700001)(47076005)(356005)(336012)(82740400003)(316002)(26005)(86362001)(1076003)(426003)(66574015)(2616005)(7636003)(36756003)(5660300002)(8936002)(8676002)(41300700001)(2906002)(4326008)(15650500001)(334744004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 17:16:22.6808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34232203-ccbe-4cb1-fa0f-08dbcffdf3ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
From: Dragos Tatulea via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

VGhlIGN1cnJlbnQgZmxvdyBmb3IgdXBkYXRpbmcgYW4gbXIgd29ya3MgZGlyZWN0bHkgb24gbXZk
ZXYtPm1yIHdoaWNoCm1ha2VzIGl0IGN1bWJlcnNvbWUgdG8gaGFuZGxlIG11bHRpcGxlIG5ldyBt
ciBzdHJ1Y3RzLgoKVGhpcyBwYXRjaCBtYWtlcyB0aGUgZmxvdyBtb3JlIHN0cmFpZ2h0Zm9yd2Fy
ZCBieSBoYXZpbmcKbWx4NV92ZHBhX2NyZWF0ZV9tciByZXR1cm4gYSBuZXcgbXIgd2hpY2ggd2ls
bCB1cGRhdGUgdGhlIG9sZCBtciAoaWYKYW55KS4gVGhlIG9sZCBtciB3aWxsIGJlIGRlbGV0ZWQg
YW5kIHVubGlua2VkIGZyb20gbXZkZXYuIEZvciB0aGUgY2FzZQp3aGVuIHRoZSBpb3RsYiBpcyBl
bXB0eSAobm90IE5VTEwpLCB0aGUgb2xkIG1yIHdpbGwgYmUgY2xlYXJlZC4KClRoaXMgY2hhbmdl
IHBhdmVzIHRoZSB3YXkgZm9yIGFkZGluZyBtcnMgZm9yIGRpZmZlcmVudCBBU0lEcy4KClRoZSBp
bml0aWFsaXplZCBib29sIGlzIG5vIGxvbmdlciBuZWVkZWQgYXMgbXIgaXMgbm93IGEgcG9pbnRl
ciBpbiB0aGUKbWx4NV92ZHBhX2RldiBzdHJ1Y3Qgd2hpY2ggd2lsbCBiZSBOVUxMIHdoZW4gbm90
IGluaXRpYWxpemVkLgoKQWNrZWQtYnk6IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQu
Y29tPgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KU2lnbmVkLW9m
Zi1ieTogRHJhZ29zIFRhdHVsZWEgPGR0YXR1bGVhQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy92
ZHBhL21seDUvY29yZS9tbHg1X3ZkcGEuaCB8IDE0ICsrKy0tCiBkcml2ZXJzL3ZkcGEvbWx4NS9j
b3JlL21yLmMgICAgICAgIHwgODcgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiBkcml2
ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMgIHwgNTMgKysrKysrKysrLS0tLS0tLS0tCiAz
IGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmggYi9kcml2ZXJzL3ZkcGEv
bWx4NS9jb3JlL21seDVfdmRwYS5oCmluZGV4IDljNmFjNDJjMjFlMS4uYmJlNDMzNTEwNmJkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oCisrKyBiL2RyaXZl
cnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgKQEAgLTMxLDggKzMxLDYgQEAgc3RydWN0IG1s
eDVfdmRwYV9tciB7CiAJc3RydWN0IGxpc3RfaGVhZCBoZWFkOwogCXVuc2lnbmVkIGxvbmcgbnVt
X2RpcmVjdHM7CiAJdW5zaWduZWQgbG9uZyBudW1fa2xtczsKLQkvKiBzdGF0ZSBvZiBkdnEgbXIg
Ki8KLQlib29sIGluaXRpYWxpemVkOwogCiAJYm9vbCB1c2VyX21yOwogfTsKQEAgLTkxLDcgKzg5
LDcgQEAgc3RydWN0IG1seDVfdmRwYV9kZXYgewogCXUxNiBtYXhfaWR4OwogCXUzMiBnZW5lcmF0
aW9uOwogCi0Jc3RydWN0IG1seDVfdmRwYV9tciBtcjsKKwlzdHJ1Y3QgbWx4NV92ZHBhX21yICpt
cjsKIAkvKiBzZXJpYWxpemUgbXIgYWNjZXNzICovCiAJc3RydWN0IG11dGV4IG1yX210eDsKIAlz
dHJ1Y3QgbWx4NV9jb250cm9sX3ZxIGN2cTsKQEAgLTExNCwxNCArMTEyLDE0IEBAIHZvaWQgbWx4
NV92ZHBhX2ZyZWVfcmVzb3VyY2VzKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldik7CiBpbnQg
bWx4NV92ZHBhX2NyZWF0ZV9ta2V5KHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdTMyICpt
a2V5LCB1MzIgKmluLAogCQkJICBpbnQgaW5sZW4pOwogaW50IG1seDVfdmRwYV9kZXN0cm95X21r
ZXkoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LCB1MzIgbWtleSk7Ci1pbnQgbWx4NV92ZHBh
X2hhbmRsZV9zZXRfbWFwKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgc3RydWN0IHZob3N0
X2lvdGxiICppb3RsYiwKLQkJCSAgICAgYm9vbCAqY2hhbmdlX21hcCwgdW5zaWduZWQgaW50IGFz
aWQpOwotaW50IG1seDVfdmRwYV9jcmVhdGVfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2
LAotCQkJc3RydWN0IG1seDVfdmRwYV9tciAqbXIsCi0JCQlzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlv
dGxiKTsKK3N0cnVjdCBtbHg1X3ZkcGFfbXIgKm1seDVfdmRwYV9jcmVhdGVfbXIoc3RydWN0IG1s
eDVfdmRwYV9kZXYgKm12ZGV2LAorCQkJCQkgc3RydWN0IHZob3N0X2lvdGxiICppb3RsYik7CiB2
b2lkIG1seDVfdmRwYV9kZXN0cm95X21yX3Jlc291cmNlcyhzdHJ1Y3QgbWx4NV92ZHBhX2RldiAq
bXZkZXYpOwogdm9pZCBtbHg1X3ZkcGFfZGVzdHJveV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAq
bXZkZXYsCiAJCQkgIHN0cnVjdCBtbHg1X3ZkcGFfbXIgKm1yKTsKK3ZvaWQgbWx4NV92ZHBhX3Vw
ZGF0ZV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsCisJCQkgc3RydWN0IG1seDVfdmRw
YV9tciAqbXIsCisJCQkgdW5zaWduZWQgaW50IGFzaWQpOwogaW50IG1seDVfdmRwYV91cGRhdGVf
Y3ZxX2lvdGxiKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwKIAkJCQlzdHJ1Y3Qgdmhvc3Rf
aW90bGIgKmlvdGxiLAogCQkJCXVuc2lnbmVkIGludCBhc2lkKTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmRwYS9tbHg1L2NvcmUvbXIuYyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYwppbmRl
eCBhYmQ2YTZmYjEyMmYuLjAwZWZmNWEwNzE1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZHBhL21s
eDUvY29yZS9tci5jCisrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYwpAQCAtNDk1LDMw
ICs0OTUsNTEgQEAgc3RhdGljIHZvaWQgZGVzdHJveV91c2VyX21yKHN0cnVjdCBtbHg1X3ZkcGFf
ZGV2ICptdmRldiwgc3RydWN0IG1seDVfdmRwYV9tciAqbXIKIAogc3RhdGljIHZvaWQgX21seDVf
dmRwYV9kZXN0cm95X21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgc3RydWN0IG1seDVf
dmRwYV9tciAqbXIpCiB7Ci0JaWYgKCFtci0+aW5pdGlhbGl6ZWQpCi0JCXJldHVybjsKLQogCWlm
IChtci0+dXNlcl9tcikKIAkJZGVzdHJveV91c2VyX21yKG12ZGV2LCBtcik7CiAJZWxzZQogCQlk
ZXN0cm95X2RtYV9tcihtdmRldiwgbXIpOwotCi0JbXItPmluaXRpYWxpemVkID0gZmFsc2U7CiB9
CiAKIHZvaWQgbWx4NV92ZHBhX2Rlc3Ryb3lfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2
LAogCQkJICBzdHJ1Y3QgbWx4NV92ZHBhX21yICptcikKIHsKKwlpZiAoIW1yKQorCQlyZXR1cm47
CisKIAltdXRleF9sb2NrKCZtdmRldi0+bXJfbXR4KTsKIAogCV9tbHg1X3ZkcGFfZGVzdHJveV9t
cihtdmRldiwgbXIpOwogCisJaWYgKG12ZGV2LT5tciA9PSBtcikKKwkJbXZkZXYtPm1yID0gTlVM
TDsKKworCW11dGV4X3VubG9jaygmbXZkZXYtPm1yX210eCk7CisKKwlrZnJlZShtcik7Cit9CisK
K3ZvaWQgbWx4NV92ZHBhX3VwZGF0ZV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsCisJ
CQkgc3RydWN0IG1seDVfdmRwYV9tciAqbmV3X21yLAorCQkJIHVuc2lnbmVkIGludCBhc2lkKQor
eworCXN0cnVjdCBtbHg1X3ZkcGFfbXIgKm9sZF9tciA9IG12ZGV2LT5tcjsKKworCW11dGV4X2xv
Y2soJm12ZGV2LT5tcl9tdHgpOworCisJbXZkZXYtPm1yID0gbmV3X21yOworCWlmIChvbGRfbXIp
IHsKKwkJX21seDVfdmRwYV9kZXN0cm95X21yKG12ZGV2LCBvbGRfbXIpOworCQlrZnJlZShvbGRf
bXIpOworCX0KKwogCW11dGV4X3VubG9jaygmbXZkZXYtPm1yX210eCk7CisKIH0KIAogdm9pZCBt
bHg1X3ZkcGFfZGVzdHJveV9tcl9yZXNvdXJjZXMoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2
KQogewotCW1seDVfdmRwYV9kZXN0cm95X21yKG12ZGV2LCAmbXZkZXYtPm1yKTsKKwltbHg1X3Zk
cGFfZGVzdHJveV9tcihtdmRldiwgbXZkZXYtPm1yKTsKIAlwcnVuZV9pb3RsYihtdmRldik7CiB9
CiAKQEAgLTUyOCw1MiArNTQ5LDM2IEBAIHN0YXRpYyBpbnQgX21seDVfdmRwYV9jcmVhdGVfbXIo
c3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LAogewogCWludCBlcnI7CiAKLQlpZiAobXItPmlu
aXRpYWxpemVkKQotCQlyZXR1cm4gMDsKLQogCWlmIChpb3RsYikKIAkJZXJyID0gY3JlYXRlX3Vz
ZXJfbXIobXZkZXYsIG1yLCBpb3RsYik7CiAJZWxzZQogCQllcnIgPSBjcmVhdGVfZG1hX21yKG12
ZGV2LCBtcik7CiAKLQlpZiAoZXJyKQotCQlyZXR1cm4gZXJyOwotCi0JbXItPmluaXRpYWxpemVk
ID0gdHJ1ZTsKLQotCXJldHVybiAwOworCXJldHVybiBlcnI7CiB9CiAKLWludCBtbHg1X3ZkcGFf
Y3JlYXRlX21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwKLQkJCXN0cnVjdCBtbHg1X3Zk
cGFfbXIgKm1yLAotCQkJc3RydWN0IHZob3N0X2lvdGxiICppb3RsYikKK3N0cnVjdCBtbHg1X3Zk
cGFfbXIgKm1seDVfdmRwYV9jcmVhdGVfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LAor
CQkJCQkgc3RydWN0IHZob3N0X2lvdGxiICppb3RsYikKIHsKKwlzdHJ1Y3QgbWx4NV92ZHBhX21y
ICptcjsKIAlpbnQgZXJyOwogCisJbXIgPSBremFsbG9jKHNpemVvZigqbXIpLCBHRlBfS0VSTkVM
KTsKKwlpZiAoIW1yKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKKwogCW11dGV4X2xvY2so
Jm12ZGV2LT5tcl9tdHgpOwogCWVyciA9IF9tbHg1X3ZkcGFfY3JlYXRlX21yKG12ZGV2LCBtciwg
aW90bGIpOwogCW11dGV4X3VubG9jaygmbXZkZXYtPm1yX210eCk7CiAKLQlyZXR1cm4gZXJyOwot
fQotCi1pbnQgbWx4NV92ZHBhX2hhbmRsZV9zZXRfbWFwKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICpt
dmRldiwgc3RydWN0IHZob3N0X2lvdGxiICppb3RsYiwKLQkJCSAgICAgYm9vbCAqY2hhbmdlX21h
cCwgdW5zaWduZWQgaW50IGFzaWQpCi17Ci0Jc3RydWN0IG1seDVfdmRwYV9tciAqbXIgPSAmbXZk
ZXYtPm1yOwotCWludCBlcnIgPSAwOworCWlmIChlcnIpCisJCWdvdG8gb3V0X2VycjsKIAotCSpj
aGFuZ2VfbWFwID0gZmFsc2U7Ci0JbXV0ZXhfbG9jaygmbXZkZXYtPm1yX210eCk7Ci0JaWYgKG1y
LT5pbml0aWFsaXplZCkgewotCQltbHg1X3ZkcGFfaW5mbyhtdmRldiwgIm1lbW9yeSBtYXAgdXBk
YXRlXG4iKTsKLQkJKmNoYW5nZV9tYXAgPSB0cnVlOwotCX0KLQlpZiAoISpjaGFuZ2VfbWFwKQot
CQllcnIgPSBfbWx4NV92ZHBhX2NyZWF0ZV9tcihtdmRldiwgbXIsIGlvdGxiKTsKLQltdXRleF91
bmxvY2soJm12ZGV2LT5tcl9tdHgpOworCXJldHVybiBtcjsKIAotCXJldHVybiBlcnI7CitvdXRf
ZXJyOgorCWtmcmVlKG1yKTsKKwlyZXR1cm4gRVJSX1BUUihlcnIpOwogfQogCiBpbnQgbWx4NV92
ZHBhX3VwZGF0ZV9jdnFfaW90bGIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LApAQCAtNTk3
LDExICs2MDIsMTMgQEAgaW50IG1seDVfdmRwYV91cGRhdGVfY3ZxX2lvdGxiKHN0cnVjdCBtbHg1
X3ZkcGFfZGV2ICptdmRldiwKIAogaW50IG1seDVfdmRwYV9jcmVhdGVfZG1hX21yKHN0cnVjdCBt
bHg1X3ZkcGFfZGV2ICptdmRldikKIHsKLQlpbnQgZXJyOworCXN0cnVjdCBtbHg1X3ZkcGFfbXIg
Km1yOwogCi0JZXJyID0gbWx4NV92ZHBhX2NyZWF0ZV9tcihtdmRldiwgJm12ZGV2LT5tciwgTlVM
TCk7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKKwltciA9IG1seDVfdmRwYV9jcmVhdGVfbXIo
bXZkZXYsIE5VTEwpOworCWlmIChJU19FUlIobXIpKQorCQlyZXR1cm4gUFRSX0VSUihtcik7CisK
KwltbHg1X3ZkcGFfdXBkYXRlX21yKG12ZGV2LCBtciwgMCk7CiAKIAlyZXR1cm4gbWx4NV92ZHBh
X3VwZGF0ZV9jdnFfaW90bGIobXZkZXYsIE5VTEwsIDApOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVf
dm5ldC5jCmluZGV4IDI1NmZkZDgwYzMyMS4uN2I4Nzg5OTViNmFhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKKysrIGIvZHJpdmVycy92ZHBhL21seDUvbmV0
L21seDVfdm5ldC5jCkBAIC04NzMsNyArODczLDcgQEAgc3RhdGljIGludCBjcmVhdGVfdmlydHF1
ZXVlKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX3ZpcnRxdWUK
IAlNTFg1X1NFVDY0KHZpcnRpb19xLCB2cV9jdHgsIGRlc2NfYWRkciwgbXZxLT5kZXNjX2FkZHIp
OwogCU1MWDVfU0VUNjQodmlydGlvX3EsIHZxX2N0eCwgdXNlZF9hZGRyLCBtdnEtPmRldmljZV9h
ZGRyKTsKIAlNTFg1X1NFVDY0KHZpcnRpb19xLCB2cV9jdHgsIGF2YWlsYWJsZV9hZGRyLCBtdnEt
PmRyaXZlcl9hZGRyKTsKLQlNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4LCB2aXJ0aW9fcV9ta2V5
LCBuZGV2LT5tdmRldi5tci5ta2V5KTsKKwlNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4LCB2aXJ0
aW9fcV9ta2V5LCBuZGV2LT5tdmRldi5tci0+bWtleSk7CiAJTUxYNV9TRVQodmlydGlvX3EsIHZx
X2N0eCwgdW1lbV8xX2lkLCBtdnEtPnVtZW0xLmlkKTsKIAlNTFg1X1NFVCh2aXJ0aW9fcSwgdnFf
Y3R4LCB1bWVtXzFfc2l6ZSwgbXZxLT51bWVtMS5zaXplKTsKIAlNTFg1X1NFVCh2aXJ0aW9fcSwg
dnFfY3R4LCB1bWVtXzJfaWQsIG12cS0+dW1lbTIuaWQpOwpAQCAtMjYzMyw3ICsyNjMzLDcgQEAg
c3RhdGljIHZvaWQgcmVzdG9yZV9jaGFubmVsc19pbmZvKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpu
ZGV2KQogfQogCiBzdGF0aWMgaW50IG1seDVfdmRwYV9jaGFuZ2VfbWFwKHN0cnVjdCBtbHg1X3Zk
cGFfZGV2ICptdmRldiwKLQkJCQlzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiLCB1bnNpZ25lZCBp
bnQgYXNpZCkKKwkJCQlzdHJ1Y3QgbWx4NV92ZHBhX21yICpuZXdfbXIsIHVuc2lnbmVkIGludCBh
c2lkKQogewogCXN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2ID0gdG9fbWx4NV92ZHBhX25kZXYo
bXZkZXYpOwogCWludCBlcnI7CkBAIC0yNjQxLDI3ICsyNjQxLDE4IEBAIHN0YXRpYyBpbnQgbWx4
NV92ZHBhX2NoYW5nZV9tYXAoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LAogCXN1c3BlbmRf
dnFzKG5kZXYpOwogCWVyciA9IHNhdmVfY2hhbm5lbHNfaW5mbyhuZGV2KTsKIAlpZiAoZXJyKQot
CQlnb3RvIGVycl9tcjsKKwkJcmV0dXJuIGVycjsKIAogCXRlYXJkb3duX2RyaXZlcihuZGV2KTsK
LQltbHg1X3ZkcGFfZGVzdHJveV9tcihtdmRldiwgJm12ZGV2LT5tcik7Ci0JZXJyID0gbWx4NV92
ZHBhX2NyZWF0ZV9tcihtdmRldiwgJm12ZGV2LT5tciwgaW90bGIpOwotCWlmIChlcnIpCi0JCWdv
dG8gZXJyX21yOworCisJbWx4NV92ZHBhX3VwZGF0ZV9tcihtdmRldiwgbmV3X21yLCBhc2lkKTsK
IAogCWlmICghKG12ZGV2LT5zdGF0dXMgJiBWSVJUSU9fQ09ORklHX1NfRFJJVkVSX09LKSB8fCBt
dmRldi0+c3VzcGVuZGVkKQotCQlnb3RvIGVycl9tcjsKKwkJcmV0dXJuIDA7CiAKIAlyZXN0b3Jl
X2NoYW5uZWxzX2luZm8obmRldik7CiAJZXJyID0gc2V0dXBfZHJpdmVyKG12ZGV2KTsKLQlpZiAo
ZXJyKQotCQlnb3RvIGVycl9zZXR1cDsKLQotCXJldHVybiAwOwogCi1lcnJfc2V0dXA6Ci0JbWx4
NV92ZHBhX2Rlc3Ryb3lfbXIobXZkZXYsICZtdmRldi0+bXIpOwotZXJyX21yOgogCXJldHVybiBl
cnI7CiB9CiAKQEAgLTI4NzUsMjYgKzI4NjYsNDAgQEAgc3RhdGljIHUzMiBtbHg1X3ZkcGFfZ2V0
X2dlbmVyYXRpb24oc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KQogc3RhdGljIGludCBzZXRfbWFw
X2RhdGEoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LCBzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlv
dGxiLAogCQkJdW5zaWduZWQgaW50IGFzaWQpCiB7Ci0JYm9vbCBjaGFuZ2VfbWFwOworCXN0cnVj
dCBtbHg1X3ZkcGFfbXIgKm5ld19tcjsKIAlpbnQgZXJyOwogCiAJaWYgKG12ZGV2LT5ncm91cDJh
c2lkW01MWDVfVkRQQV9EQVRBVlFfR1JPVVBdICE9IGFzaWQpCiAJCWdvdG8gZW5kOwogCi0JZXJy
ID0gbWx4NV92ZHBhX2hhbmRsZV9zZXRfbWFwKG12ZGV2LCBpb3RsYiwgJmNoYW5nZV9tYXAsIGFz
aWQpOwotCWlmIChlcnIpIHsKLQkJbWx4NV92ZHBhX3dhcm4obXZkZXYsICJzZXQgbWFwIGZhaWxl
ZCglZClcbiIsIGVycik7Ci0JCXJldHVybiBlcnI7CisJaWYgKHZob3N0X2lvdGxiX2l0cmVlX2Zp
cnN0KGlvdGxiLCAwLCBVNjRfTUFYKSkgeworCQluZXdfbXIgPSBtbHg1X3ZkcGFfY3JlYXRlX21y
KG12ZGV2LCBpb3RsYik7CisJCWlmIChJU19FUlIobmV3X21yKSkgeworCQkJZXJyID0gUFRSX0VS
UihuZXdfbXIpOworCQkJbWx4NV92ZHBhX3dhcm4obXZkZXYsICJjcmVhdGUgbWFwIGZhaWxlZCgl
ZClcbiIsIGVycik7CisJCQlyZXR1cm4gZXJyOworCQl9CisJfSBlbHNlIHsKKwkJLyogRW1wdHkg
aW90bGJzIGRvbid0IGhhdmUgYW4gbXIgYnV0IHdpbGwgY2xlYXIgdGhlIHByZXZpb3VzIG1yLiAq
LworCQluZXdfbXIgPSBOVUxMOwogCX0KIAotCWlmIChjaGFuZ2VfbWFwKSB7Ci0JCWVyciA9IG1s
eDVfdmRwYV9jaGFuZ2VfbWFwKG12ZGV2LCBpb3RsYiwgYXNpZCk7Ci0JCWlmIChlcnIpCi0JCQly
ZXR1cm4gZXJyOworCWlmICghbXZkZXYtPm1yKSB7CisJCW1seDVfdmRwYV91cGRhdGVfbXIobXZk
ZXYsIG5ld19tciwgYXNpZCk7CisJfSBlbHNlIHsKKwkJZXJyID0gbWx4NV92ZHBhX2NoYW5nZV9t
YXAobXZkZXYsIG5ld19tciwgYXNpZCk7CisJCWlmIChlcnIpIHsKKwkJCW1seDVfdmRwYV93YXJu
KG12ZGV2LCAiY2hhbmdlIG1hcCBmYWlsZWQoJWQpXG4iLCBlcnIpOworCQkJZ290byBvdXRfZXJy
OworCQl9CiAJfQogCiBlbmQ6CiAJcmV0dXJuIG1seDVfdmRwYV91cGRhdGVfY3ZxX2lvdGxiKG12
ZGV2LCBpb3RsYiwgYXNpZCk7CisKK291dF9lcnI6CisJbWx4NV92ZHBhX2Rlc3Ryb3lfbXIobXZk
ZXYsIG5ld19tcik7CisJcmV0dXJuIGVycjsKIH0KIAogc3RhdGljIGludCBtbHg1X3ZkcGFfc2V0
X21hcChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGludCBhc2lkLAotLSAKMi40
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
