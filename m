Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C667C5AF26A
	for <lists.virtualization@lfdr.de>; Tue,  6 Sep 2022 19:28:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B39240241;
	Tue,  6 Sep 2022 17:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B39240241
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=zg57KySg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNP3zaDxHHhS; Tue,  6 Sep 2022 17:28:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E4A7740347;
	Tue,  6 Sep 2022 17:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A7740347
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC8F9C007C;
	Tue,  6 Sep 2022 17:28:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE660C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 862FE40271
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 862FE40271
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=zg57KySg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KstaD0TGarq4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B62401F0
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B62401F0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX2yd9RcUSS8iorW7dmmZDXB+kV1ZOzw13aqkdSdBkA4779QKU2ux4L8qZgWrAUWUMEC35706m+Cmy++FT4wmWxXdgBeSJ165mnkkcQUI5bxe0Eu+fLCfDa28NFnHg7/LEtcRucy3xiYatFTqF1/SBk96JPD13pKdchJRX+lorshtr5fKjRyYX26LZKN2vvpzKBDG7fFVj3H2T5aZ98etkRh28QpdqGk01UNf27re15k2JKf+Q+vUEpHP/rKEfUpKeyjjknqbVl73U/NXYxkMCzS33rIdBOhcoiANXAGUWgx0Of+WYZujhuvJKzwk+Sys5mgnb6DaXGoaNfrS1+BpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViWJhWddA9p6yc+1v0OJBD9s5Fld+/nDB3nxO2enHEo=;
 b=KcjU2NLBn2jDljpE9tiVEjDaZWqIFUl6VdUyjUDRnHqfm6fA0dB6ASgiPHpyXudUW7jQYgC0TMsmWboj6HYsXd+liaBjcliqCvuUNggDxJMOWvkPYFFOY09L9KUY0oUxMLq0W5TckQKMaxdlc0DmGXrOQTkZ34lgGrLD+DQOsMcASpDPegwNuPEftYvDIxh0ad6/dUljnkaW1QzaZQZHRCWH1weE9ZxHflrln1y57C1VVRTQJKxsseUk9vG2BJ54xgs8xRyL29gArHxM3xA8F381kRf9BEiEYFPUCxJFafDOI8XsGcK5/b5tKuSv0v9iTYhqd+ImV3Dhl4+TZMHKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViWJhWddA9p6yc+1v0OJBD9s5Fld+/nDB3nxO2enHEo=;
 b=zg57KySg7e5E4zNpMTPRNYqSc8OtRooQqgRownRNosGd1hBJ6H5cxVJe83olhRyvH25ic6p+T0F2gV8e5AAGa9ls5DXaEuPNis+5uV+nZayv2jXISPWyFtEklfheuSmzWBY/mBygVC5Y71NLaUEJumicZBtglXIv1EAUVVF0VJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BYAPR05MB3960.namprd05.prod.outlook.com (2603:10b6:a02:88::12)
 by BN7PR05MB4276.namprd05.prod.outlook.com (2603:10b6:406:f1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5; Tue, 6 Sep
 2022 17:28:25 +0000
Received: from BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::a8ee:57cf:b2f1:b818]) by BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::a8ee:57cf:b2f1:b818%5]) with mapi id 15.20.5612.011; Tue, 6 Sep 2022
 17:28:25 +0000
To: vbhakta@vmware.com, namit@vmware.com, bryantan@vmware.com,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com, doshir@vmware.com,
 sgarzare@redhat.com, gregkh@linuxfoundation.org, davem@davemloft.net
Subject: [PATCH 1/3] MAINTAINERS: Change VMware PVSCSI driver entry to upper
 case
Date: Tue,  6 Sep 2022 10:27:20 -0700
Message-Id: <20220906172722.19862-2-vdasa@vmware.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906172722.19862-1-vdasa@vmware.com>
References: <20220906172722.19862-1-vdasa@vmware.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To BYAPR05MB3960.namprd05.prod.outlook.com
 (2603:10b6:a02:88::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR05MB3960:EE_|BN7PR05MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c20d19-48b8-4d07-867d-08da902d344e
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjv/vW8VDrLam7WsY9XPFJzY7VV9pUl64Z2aRz6CLMu5shVx/adi+a+SycLB64q9hlFDTs5Jk8ay4GkV5SFe4eL8SStz5l8vp0kxri3C7pC+u8zz4WaPmn0Xh8SJMIVOhJX+Ks/Hvzf5xZXycRkZqnvki/27aGWfM9IU4iOicnhRF8KtiaGAbBlTca0rbrNi08BnLPedzFBUTsXUp9KkkynObZTLRHmK4j3u1JVHijUT1+GgwxrjovQl1OcoxVimriWabCgJ3OsKjK7ABENtCI2rZYaxzb7rEuJY39nzYVHlgyNQDSOEOo870xNdhDnftTsozpQw35I/Ql0zbsHtf3cD3a9u6CXTFCVPNd889vZjHSO5p6WBgS7IHKQWohH5dQ1QjzXImeIrKBGyt9ovz4CN4UaQoa4oyQMACD7Mt4DodY1LuJyhr4Tei+5MiXecCKgLTVlsaxR9rrGhkUE9RX9ebWQ1y4rUi26U0Eu3I2unrfgFl2+KCIrPBPLy+nF3L23rO8v4xFIKTa8kYdnvfFC/NmeCFcTlIS/cPDRG8A7lyGNB78hy9+Ute460foQSwMT7ZwJYYGyGCW/r1QGUiVEUOA+Wl5E/DODrwIX36caeO8qvnICt03bFB3s6pwR7Fvlq4cOlPAL2HGt6fWSXe0DEXYt59zzZdqUj63PPk8qUe/zfUo7r/6zUbs4JnhxS5MW5DlMAnShBWFYdSJ2wBZCg1UJRD/VMcMAXp1Jofe0tAsScO8bV1U7p1MPfr6jbDrtypIq8ZUhGkmU9kOuOwbMTSmI40ItPGT3E+FN15VRjlJZGotvshjUzxA9GE4Fn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB3960.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(38350700002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(2906002)(4744005)(7416002)(5660300002)(8936002)(186003)(1076003)(2616005)(9686003)(6512007)(83380400001)(41300700001)(6486002)(478600001)(6506007)(86362001)(26005)(52116002)(6666004)(36756003)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0FqyscNCPX4R7wW0wGtsMwSbJgFgv3pS5ytJVQF9UB0nGvPGmUgsXyOLB3h?=
 =?us-ascii?Q?V+0Ja0CoHAzlqx2sTeX9TMf0nw3AmeE1VyqCfFegv9p2YWGM9/RijXuBLnek?=
 =?us-ascii?Q?bGyL1t8vddWtEjHrsQrZOJcZfM0ZNAjahgsYDDwAlIRLI/N5uXHdiTlci2Jh?=
 =?us-ascii?Q?UqgzSNeNHSueAqJNQqy+/gq9rReV71yhQkubPOZm5NR+3SYngbNQs4JTSE+2?=
 =?us-ascii?Q?DodLPsDkca0FlRkunMbU0zRUfKGGupbdenuhsT+HC3txsPvB0DD2OcrPJr2o?=
 =?us-ascii?Q?GIKMHiZgPBYo7Km/oNKXItAvahNJzqbu/VZOX0GeE9qGkDAalX0lXUKwQLCQ?=
 =?us-ascii?Q?w8I0j3Q7N0qxzCsz/+/DLjB7rFYdOj/gHxm2oMvhmCeQdObGsCAjrTlY4FdK?=
 =?us-ascii?Q?ttD9RJuCh+97v3ahiPi7kmkkF4Ts0brzdcsQoyAHRagjCNY6sbwf32yXeE06?=
 =?us-ascii?Q?fasgGQ7v3tNdqUNztWNG2BY8r0X3CenjtUuk9TPie4qCl+g8NqeLnAnZa9dD?=
 =?us-ascii?Q?M19A/jgVq97TvPi2+FolRK8nQJrs9uRXYWoGbRdi/9gexFTOpzwaF7RjN/RQ?=
 =?us-ascii?Q?bG+qcSoqgwzG4FIu8U5ANq5wQTki8+8go0AnmUj9vsSPnBphxTG5GjNHTEsz?=
 =?us-ascii?Q?/tT5GJIGtxzXEnVj7hBEgoU6UA/ns/22Ccc9xB0fyFli8NK67ugLdebKWx8q?=
 =?us-ascii?Q?tuIX945VVXzKCJMhiWB8AwkwEQARIhWyC3/MG7PfdBuYVi3DsHMZ8g7FJ3cB?=
 =?us-ascii?Q?uSuggKYA5eHZhHTFyMXt/xMD+kmPEV4wWwgZ1wLYp/4Xw6mAGknTtZ/wctKf?=
 =?us-ascii?Q?yusj8gIvuIyxQ5FE4FXXkuuKhXHS8PSJpS9LSEUtsonYTnPdqoWRlc2K8tVR?=
 =?us-ascii?Q?wWfnKyiSLa/3UvujrGF5AtntB/Ff/waA6tA2SiefNiXYzlOIy/bEF6k8VVmR?=
 =?us-ascii?Q?oFZTUANtWkL4/asSbLShfuJPEdAjKoZffoogrPi9beAg9Xd8Sv6dUbQ58HXi?=
 =?us-ascii?Q?q+i2JtL/DbB62QYqu5cbiM0RcLLhlxOgvyfCtlfONjZF3s7Hq1jWIEJPds+r?=
 =?us-ascii?Q?UY8NK1Fq7wGvn+6WKul8wi5Q2j8tNF4+7xISGQVYaI9aUqvEw6lnjqj2Omfh?=
 =?us-ascii?Q?YbkYOfcui9ko4MfJvnQCrdyj2HmAXgBJqxRjE9mBUXCmwaWc0zMH316lSRYa?=
 =?us-ascii?Q?mHmyY123VaDb1nIlaF7rUMNfvdCTWXpt/oH+Zm8C6w/kc9bsTPoDbHxPEXij?=
 =?us-ascii?Q?fAhGa/ILwBOdaGcvZ7YVQkzTKdnd68hlYUhatlcMFKrMEvNKvvOcxNDDkhZF?=
 =?us-ascii?Q?uA3uVh/km7JXAgYNyNRjCY+Q6G+AvXEtRbcMt0eVD4LbVpK9dohH7bZ4QhoO?=
 =?us-ascii?Q?j5+Wogp4GDOa65Lo5s77QudSlu/j3zO4kVlGeod1cTojVwZhvjvWugtrZHSs?=
 =?us-ascii?Q?zqIOpfyi+FgFMX8PWfnMmBXvsjZkAdsr3n3NaMxcIVt3u/fyR7xn/c5XrEUW?=
 =?us-ascii?Q?uv8znBUMBgGTIfYzGyzzU+jbrQk8osGeX14b4U4ltLb9yFw0S4KJeVzQQYyl?=
 =?us-ascii?Q?DuayN0Vs/hAG+yd0gE8=3D?=
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

Change 'VMware PVSCSI driver' entry to upper case.

This is a trivial change being done for uniformity.

Signed-off-by: Vishnu Dasa <vdasa@vmware.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38f9ef4b53ec..b75eb23a099b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21834,7 +21834,7 @@ L:	linux-rdma@vger.kernel.org
 S:	Maintained
 F:	drivers/infiniband/hw/vmw_pvrdma/
 
-VMware PVSCSI driver
+VMWARE PVSCSI DRIVER
 M:	Vishal Bhakta <vbhakta@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-scsi@vger.kernel.org
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
