Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36C5AF26B
	for <lists.virtualization@lfdr.de>; Tue,  6 Sep 2022 19:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E03827FB;
	Tue,  6 Sep 2022 17:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E03827FB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=TqGVrKTg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9W4SmUW3jcOl; Tue,  6 Sep 2022 17:28:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0BF5B82AED;
	Tue,  6 Sep 2022 17:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF5B82AED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BF13C007C;
	Tue,  6 Sep 2022 17:28:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28585C0033
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA6D081390
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6D081390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvSxhTHr2Z82
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E489181329
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E489181329
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li+/EbUQewoNJXiIE5TMVTZCKmBfOTqYLbZj/CIDQCsu+lgb1gM05mzVBmtjCLyrXD29INP+le73Cjqthch8ajL61zJ9aHlk7yjk8Lwp6SaE9sg4rVtElnGt7VJrG+REVVNwADKKR/9gA7yHIjH2O9ADZtdjfqrrAd1rQ10MWlPn6CiYNu24sddJjunPmG+S9tSIJ5Z7UmLW1Uh74d9d+fnRY2CyiIDZyaW3XFtvnd1oHGvlanWwEMJzWf6x5xwad81PR45RWY7ku0z+FTRV/t7PdtvIRP76ZWHaRcgXaHG5EPOhhj1Et0mvp/+GpAeuHyJZMmLVBIwsG34oow/Gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFyi6NeswriSk0EZsoiBbdLKpxeWFrpvWdaWezpo0XY=;
 b=djEbTh2OA1/OlAy1lNcONrPFMD9a4P/7wNFm0xtIZVGnFWgxHTj6AfAy6d8YrXE706WQ23Up3OskRrDl0V0FuFHIMjeafhpeTIZP+ZssBaFGc6ePGtEKEzdkJEGg3PwDiaOZmRr4v17WB4OfqNOekoFBVxYr0/zfpes1sXQ6u7ZM+bCdV8IfCYti4+yI0PCv3Npx7aYEhCHJFUk+D7tsfKnnJWT0kueY6Y4PNLq8uQ64oy1chj6IQ3q7PupFcvBwuDox/gK64anUPQHH8xK6LMH10z71JdQIQgoHWh+/izpW+Vrr3lafbsQQbisiw5MkRKdwrGcH9mIGLGmD7qmrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFyi6NeswriSk0EZsoiBbdLKpxeWFrpvWdaWezpo0XY=;
 b=TqGVrKTg+VBefYRUAZXifPLZ7EjGWTfkgpzM2Kv+bu4X0PyJW4+hHfI/enVuKomS6B9U+oM+MTjoT0jB0XsROGzOxpy78QXdxlelwoavq9vAYFEFvSgLPcwOjP5KVC8iK6CRGJFeRLh1fOI7T4W+dyXUiSRcD+R6iroOG7PELPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BYAPR05MB3960.namprd05.prod.outlook.com (2603:10b6:a02:88::12)
 by BN7PR05MB4276.namprd05.prod.outlook.com (2603:10b6:406:f1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5; Tue, 6 Sep
 2022 17:28:30 +0000
Received: from BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::a8ee:57cf:b2f1:b818]) by BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::a8ee:57cf:b2f1:b818%5]) with mapi id 15.20.5612.011; Tue, 6 Sep 2022
 17:28:30 +0000
To: vbhakta@vmware.com, namit@vmware.com, bryantan@vmware.com,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com, doshir@vmware.com,
 sgarzare@redhat.com, gregkh@linuxfoundation.org, davem@davemloft.net
Subject: [PATCH 2/3] MAINTAINERS: Change status of some VMware drivers
Date: Tue,  6 Sep 2022 10:27:21 -0700
Message-Id: <20220906172722.19862-3-vdasa@vmware.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906172722.19862-1-vdasa@vmware.com>
References: <20220906172722.19862-1-vdasa@vmware.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To BYAPR05MB3960.namprd05.prod.outlook.com
 (2603:10b6:a02:88::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR05MB3960:EE_|BN7PR05MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 77adfd25-64f6-43e3-aa98-08da902d36e7
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ze5l4086Ktbvw+k5+OQXVC+KWjV14ZZoIIjui1WRqWTZJ60vYtr4WzHfZQvLAUgAuxseSGATMiqBAjOnyq5jwjvbCnl67D1HVTHRW0FgneXbfXJd03mjBdYo67+YM194dnhJYaJZX8AXMphZuFoxx4XppP1wF7J5HI/S5CgM7gTF7EVxEtWdQcqmzRzxa2eal5lhUMRadyuKgCxYqqjcywG7RIetxT9tU7H5WXDzt6FFyUWhIlDS1/ISkg06xp7tE+OEE1s0hBZiab6NKvQvNV4HrcryXBzwYkWMGhrWudj2kihI2IkjU0UV4YAr1a3WRNFKk3ewCF6/Wplvbx7wZdHS7opuGt6YFAB7ilH2srkiUIvaNx4BqvW8rNXDcy5YJ2AHR9t5TOyK6Jkh/HNlTkZvYCs2UXxvdKP0+sWeV+5ARclbEewN3DDXbK2MIUvDQAZRx6+9GJumwhXniPXs/1Rw8fevqQGcT8q8pkwRS8g+ldm9bDxFh9qBnPOrP5LOOWiDpqCJB3ItvglvSKtnA9OznIQ5Hj1RzVaKNU21nlh4xdHaWht5SIq2iHigKLzj2woqZEw7ryGH8CMz/FakTIIPvXTyl0h+c5CYP4rmkVfy192vAH2uYdn+QAsXmqMxr6TznItUdt/uSY2ijbEd3NPR8omuA6A6bnvBzzqs2sisiH0pKWQEdWPFycHnQWcwWgMf9NT5iZct2qAbZDZOLNwPBu1yzfWRWOPfWhMHHCKjfz/pldalv/8BmzNRHH2BBZwZbZ69BVc08PUHV+ifJvz6Nh1J7BsNFha+1NR8VVI7haP6bUN/Fkmu4bTtPufAvQ0/E+MMl94iZ2gkRTtgCw8Z+dmObGykydwifjb3tDRuBhFXDvi7Gtabp+33GupbCoy9CnI8DxIM6hWZHfeObQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB3960.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(38350700002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(2906002)(7416002)(5660300002)(8936002)(186003)(1076003)(2616005)(9686003)(6512007)(83380400001)(41300700001)(966005)(6486002)(478600001)(6506007)(86362001)(26005)(52116002)(6666004)(36756003)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tSVSoBp5Vs+4Lnhd0wBh6EesTRXuaDNROrVD4U5yEtumZk7DgdQFpRCvVysI?=
 =?us-ascii?Q?9mr/sS9q3OZaWFAmGNYOQGosBLN05emJQyjmVV7J11gRBTO79I9vU8a7FEze?=
 =?us-ascii?Q?6w1XplBIv8YnAutoBliJIikGdTwff6VbGKDa5rMPqT3ctSl50Q8+7MGeCy+z?=
 =?us-ascii?Q?umXpnlyYuDazIzvHNOf35kNcmOHcbjmUyA73rKyGeox28xcpfi9VGth3gJhV?=
 =?us-ascii?Q?eiqZh9YLEAkY6XYF99YjqHdh4g4BP5oiUzSc6topyBSMWEdw669pU0Pqd1qP?=
 =?us-ascii?Q?TTdcKXXxIdZpjUnK66P6FYXP6WWl8QmYHio7hW6ZTBX3wL8lNiN/V8Zx3LuR?=
 =?us-ascii?Q?xG0TlshyJK8MMI5eS6B1tNbhgLLob3q2Ye0RUTM4gl7eFjpMGSsC0sND63Zo?=
 =?us-ascii?Q?dlpnvk1EC4l2k/ePBaARsAT5g/tagWmyx7YbvrjdF2/lANwSazz6tewcM1v8?=
 =?us-ascii?Q?hf7RTDnCD6GJLrQT054JpkyQ2AlHRm9Gy+5Dp+P+kdCG/SuVmP5AMlRFV6Mw?=
 =?us-ascii?Q?IhwfqKBme7IzlAyBu2TVNrDWsxoemQYHa3bVMYCKr0FnFy0jkgxmC1xe7+1V?=
 =?us-ascii?Q?gR+ggGyd1mx4XULqXX1w+0FOCHifjasz7FAj5rvSf4zZL53em+xljhJnhLRe?=
 =?us-ascii?Q?EmcAMdEFb/8mNc7QazvV6n9XLg42uUIRwHelRL2umxwr2JJjgrUFJ9ul7Pqq?=
 =?us-ascii?Q?Tom7lnqbgsNAP7afEM87Hm8BS8kIsZ2N/Si4QUxjCiWfGPdBYUJE3+5B4H22?=
 =?us-ascii?Q?4SXrsu0MBVbNuNl7b3myI1Y5IBsMH3bKMKMFmFMDTMDHrMSY9aGLQa3Ojdg9?=
 =?us-ascii?Q?ZD5NlmnvcSlParHM4984zPaj9KZYV2JJqLvQrlo535pctmerE6KilxVGxo7Q?=
 =?us-ascii?Q?WL4Tflbp3QoS4vjSgIvpjd2NNtqyDqv+SNCztXuQAT3Jte4R+2ux/ZrdyM0u?=
 =?us-ascii?Q?i/Zzp0F5FUR9oPhHjGQj/hGuUWgVQKhikMWMwVAT97vJpzO3cDKrt+aOaYWK?=
 =?us-ascii?Q?iRFHCZzuDpys9DpKOzT3B5ZbIpSS5RSBHJNMryANZgAgwTVy8L4G9qmS4U24?=
 =?us-ascii?Q?mx/zJeKHVFFBsc+NXCQzFuoaIZ6ueYd/sJZPJ1OWSEyWbnyaR+XrsBGPs/ue?=
 =?us-ascii?Q?86Bc7Mx3chGQiu+nXUqEII1VbnqSuWgg8tQIs6u1tCYK/hAscdaDXzF/SFC2?=
 =?us-ascii?Q?i9A8OKOpvhqkQKpvrR42VyI1P5it2oaKM6dntHSPHvhyrT0VaEjYleadBapx?=
 =?us-ascii?Q?AZ4xUBpEMUNy81bS6qaYXEedBGDAiMAwLLjvwH6Mthxnjbo7ouVbmyshtZQA?=
 =?us-ascii?Q?v58cNZIPmThL/NuknnU7Uomy7ubmJteansU8WLCjBa/7LuEnFd6dH4HCjJfP?=
 =?us-ascii?Q?8qZk48Puhwq8jKwkKrdZ0xeARXxdTg0nWmJt/1An1UrpHUthrGrgXavwG1fI?=
 =?us-ascii?Q?Lh/OC2wFbfujiLAbUZLOkvfdofFn1jrM//I8SBQQTIe8TrUg/tgr8cxCd+6F?=
 =?us-ascii?Q?tm1pRpST1dANtgZ3ia3YiBjLRxaRUJtUyD953hmMKl44/REoH10zzHl9l1CS?=
 =?us-ascii?Q?6s38mvfd7w18m4+WY3tgck6MQ3/RX9TAuDNKkYh+?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB4276
Cc: Vishnu Dasa <vdasa@vmware.com>, linux-scsi@vger.kernel.org,
 pv-drivers@vmware.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rdma@vger.kernel.org,
 linux-input@vger.kernel.org, joe@perches.com
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
From: vdasa--- via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: vdasa@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Vishnu Dasa <vdasa@vmware.com>

Change the status from 'Maintained' to 'Supported' for VMWARE
BALLOON DRIVER, VMWARE PVRDMA DRIVER, VMWARE PVSCSI driver,
VMWARE VMCI DRIVER, VMWARE VMMOUSE SUBDRIVER and VMWARE VMXNET3
ETHERNET DRIVER.

This needs to be done to conform to the guidelines in [1].
Maintainers for these drivers are VMware employees.

[1] https://docs.kernel.org/process/maintainers.html

Signed-off-by: Vishnu Dasa <vdasa@vmware.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b75eb23a099b..5a634b5d6f6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21812,7 +21812,7 @@ VMWARE BALLOON DRIVER
 M:	Nadav Amit <namit@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-kernel@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/misc/vmw_balloon.c
 
 VMWARE HYPERVISOR INTERFACE
@@ -21831,14 +21831,14 @@ M:	Bryan Tan <bryantan@vmware.com>
 M:	Vishnu Dasa <vdasa@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-rdma@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/infiniband/hw/vmw_pvrdma/
 
 VMWARE PVSCSI DRIVER
 M:	Vishal Bhakta <vbhakta@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-scsi@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/scsi/vmw_pvscsi.c
 F:	drivers/scsi/vmw_pvscsi.h
 
@@ -21854,7 +21854,7 @@ M:	Bryan Tan <bryantan@vmware.com>
 M:	Vishnu Dasa <vdasa@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-kernel@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/misc/vmw_vmci/
 
 VMWARE VMMOUSE SUBDRIVER
@@ -21862,7 +21862,7 @@ M:	Zack Rusin <zackr@vmware.com>
 R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-input@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/input/mouse/vmmouse.c
 F:	drivers/input/mouse/vmmouse.h
 
@@ -21870,7 +21870,7 @@ VMWARE VMXNET3 ETHERNET DRIVER
 M:	Ronak Doshi <doshir@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	netdev@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/net/vmxnet3/
 
 VOCORE VOCORE2 BOARD
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
