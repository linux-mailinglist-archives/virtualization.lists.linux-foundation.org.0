Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CB68E598
	for <lists.virtualization@lfdr.de>; Wed,  8 Feb 2023 02:50:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AA2D404B3;
	Wed,  8 Feb 2023 01:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AA2D404B3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=g3P7Y43k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2D0xIgWHUJeq; Wed,  8 Feb 2023 01:50:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9EE5C40B77;
	Wed,  8 Feb 2023 01:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE5C40B77
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCBBBC007C;
	Wed,  8 Feb 2023 01:50:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11E94C002B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Feb 2023 01:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3EC2404B3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Feb 2023 01:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EC2404B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFa6ZoO_Y75y
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Feb 2023 01:50:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85A1404A6
Received: from DM6FTOPR00CU001-vft-obe.outbound.protection.outlook.com
 (mail-cusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D85A1404A6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Feb 2023 01:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnqaz7Kp1dqLhyws1kC6IhgI1D/p1Nv4Wt8bmXGpyf0wS33PPd+l6u3KCt6+soo80j6AtLg6DsNyD6ZTlj0VztcNNYNwiEFnKI2MsT4Xhn7Ki1OKgrvAGKQjS59KL+LBAQ72y6EmPts43oDWhAFMANjgkAuVfX9GoGeL4Y8BN4TrkxsP8HUoLN+fOKRXXt2ezF9wyfrqoS2SzfFqSRjTSI1ywh7yHnR+P1vpy0kMNgEaqBcje+lCxNFBnOXowIs6BbxtFAAsdsLgKrPHWbQhvOg7MtIUibORxuTuec2l1KyQccvs38SGFDSRpThYFmtfzmjZOAev1UrDWaZX/9BqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWDMx1h84YD+pqNgbWv446R4leDOTHm/t9v7t2H6pKw=;
 b=HnMuyANsp26sTxMYBIyVQEmLL/ZIq8OUSYkhNtGOdtFaH2hVW3XFsSYXYzJEXqq5uxr20fbJ9XDhE00fiqdP60ax8RKnfmxRajPda1SHJBfEN+18A+NqqYJvvyNg5DFjwXlrVZstV56h2pzjFUgRN9+MC7tbwtvZ/Vso6yUDGGgPb3wF2vZaQ3wmbJC2EZRWJuSEa0TlKVMd1MTRoVCdBCTq/ugAKH9dMOXX3mVgC2JL1oFeCShPp2V20h6mI9qtVREnAYAAY1s6/GFJ4c/eXE6LiAl/Bk7lgvHO5b1u3ElLTkaNBRzfnGELIEFVC0+jzS7CTKSrNFpVUMAgpfg0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWDMx1h84YD+pqNgbWv446R4leDOTHm/t9v7t2H6pKw=;
 b=g3P7Y43kZGG8iYook6JmvBBNA4i+IaKEyq/gXmqZJCRplpLGkcPgDicoC+hUJnCywLvkWvfZyDkxYbTfkPxdI6U7iFmuANz/FOgbmjUBiHLqN+0UHxzxAG93l+OJ+EmEOmgez0yYEhEHeN1NBCQc6rrWDTOWIlC/qU4FcH6CK5o=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by SJ1PR21MB3762.namprd21.prod.outlook.com (2603:10b6:a03:451::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.1; Wed, 8 Feb
 2023 01:50:38 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::55a1:c339:a0fb:6bbf]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::55a1:c339:a0fb:6bbf%8]) with mapi id 15.20.6111.002; Wed, 8 Feb 2023
 01:50:38 +0000
To: Saurabh Sengar <ssengar@linux.microsoft.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, Saurabh Singh Sengar <ssengar@microsoft.com>, 
 "dphadke@linux.microsoft.com" <dphadke@linux.microsoft.com>
Subject: RE: [PATCH v4 3/6] Drivers: hv: vmbus: Convert acpi_device to more
 generic platform_device
Thread-Topic: [PATCH v4 3/6] Drivers: hv: vmbus: Convert acpi_device to more
 generic platform_device
Thread-Index: AQHZOsjOYlcjdnd9h0uNdQMfxigd867ERy6Q
Date: Wed, 8 Feb 2023 01:50:37 +0000
Message-ID: <BYAPR21MB1688562198940168AD7C923BD7D89@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <1675756199-5917-1-git-send-email-ssengar@linux.microsoft.com>
 <1675756199-5917-4-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1675756199-5917-4-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=017a0fed-3ca5-41e7-ba30-f05165fed8d8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-02-08T01:40:50Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|SJ1PR21MB3762:EE_
x-ms-office365-filtering-correlation-id: 7911bb12-48ed-4637-649d-08db0976e078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yi7cThCPUvPQFpK5J1NwaOiwtugya9YIkXpoHyL2ove9wT99Zd0fmEd1WPAxr2mn8J8gUJEVsySld8TCRVjf1IzboT+kvivBrl5OpJwWkv9ZzZFgXQtcfbNH/a9tYGG5aNyY/tdNLE1SYxUfuVY0jxFNTQPFbDYdicMIUK7tPaphu4u3mG5Havnl7CKOz/EeaPLK42XWCBzN9RwqYtOSR5WZx9ZsLZSuZC3PPacgmaTW8LG6guQjI6wY9e/m6h5xghn9ATISOcl0XI67Va3Ew/8c95zEA3TBBLlUeMHQ1TCUpNB4wMDovVNSUAu2bJAWxWog8MO8NkJK93DeWqH0tEe70pBsB1nmdLowMJAJhee2ESEK60myF8X/9a7PnSTIlVE+keVSGQiXSq2Ww6ymPMKSxh2jqgANhl+y5GcKaAIUNQWldPkanthD6esNyekoTUOyEaN/y1QzHfJnde2T1eVTHheSAgCFbKD97TVMCRbXfQl7MxNMHkNCcLNgNwkoMgkWuomatCmIrBW8a0ovj2CuA+/3bHpCX6LCN4s+MAHgJEauknpzVhNtuj1kOcl2h46lW7j9JZboxPEzaHyiFaq0SwfEtXGRPDb4YfH1pmVx+vMN/DHIvfmFt2Biubb8CHZokbZEGkXvwISCw6eDVNQZLbvJq7n59hQaEUYYFf7T8uqV68JU3BXVeLGt89QFgg/k+EBHmhE+jjDc0lbc4yJhTHz4JUux2OeNGV9xSo/YksjBRUhTYgQTJwbWnu5mpZtIljIdzLi7GLDMK44kIDc5lBfpgCHKSZktxlOmh6w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(7696005)(66899018)(71200400001)(478600001)(55016003)(8936002)(52536014)(186003)(9686003)(6506007)(26005)(10290500003)(66476007)(110136005)(316002)(64756008)(66446008)(66946007)(76116006)(66556008)(33656002)(921005)(82950400001)(82960400001)(41300700001)(83380400001)(8990500004)(8676002)(122000001)(2906002)(86362001)(38070700005)(5660300002)(38100700002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lJR/8Vv6AqhEH/fqcjvSiuM9c5i1XdTVbfjY4ekSGvgT1q+czPIVs/GHGeqE?=
 =?us-ascii?Q?T2KW47pUrg3C3g8wNeb/6PXWJ+xwhcrkXEg8WDkikdTjeBDKeZ3Q5jAGZHdc?=
 =?us-ascii?Q?IQ7HZGQF9QAeUsFHVYAsBcijlUouwIhWrdFu7ntbsnkDTOImky/A5P8f0Jv5?=
 =?us-ascii?Q?w6V9/aNSdO46O59nIC3vWfWPRkxl3/FTJ1n2B6WeukfsshWU+7OKz1MLSqZS?=
 =?us-ascii?Q?vSz/+7UbOK8aeP+tHOI42i8g6b3hp2w5MSAl1/tuCnJxGNn/GBjYxikdMWkq?=
 =?us-ascii?Q?yMy+v4nUt6dRsKs5dA2r8zQEcbJ62WXGH0yUx2RB2JhbMKlVAg6H8kJnUTJK?=
 =?us-ascii?Q?fLG3q1+rKVnIDdkR5e67TtpSGTUFigx4teGFJ75ut1ZrM91W07uV2QDzniYC?=
 =?us-ascii?Q?v4uL0ruCdYv2/uGgiNgvQfy5Wc2y7XLEtH8njvj1j8GmM9mSzdsJxd6RzFvB?=
 =?us-ascii?Q?ELVPkUiEy5k6bPj4/+Q7vtUxNZ4UDIaj5Rs6p/m0v4PRBLozkvlxYDK7xBgM?=
 =?us-ascii?Q?mMM0YA4XTRnChxUfMnw8KLPr3zd0sAt+pmpdWrOtyh1X+xc/L5D6U2LjCSeZ?=
 =?us-ascii?Q?CnZH+NnyUgV1TsaaH72f1R1q0wWp2VkZDIOb0VSyfG0ph84wgi/SFApbHVLU?=
 =?us-ascii?Q?8N4lcHEnczocgouRbRHZPUsm2YiWpMYelwJRckbjA4w1TmWOjMoOrtPEnPdu?=
 =?us-ascii?Q?xSq4mis1wWCwHDF1kzPZe66+ApYtH2JVlf9uxbLMeOIbf2v7M5eoXbT0WR0H?=
 =?us-ascii?Q?axxxo95bIBdNGlLcOmN8HYvuafTXnVme4Uohp5s9/GKYu3qZOBjlBLIJ+2Qm?=
 =?us-ascii?Q?2HQpz7kiNMsJdjCOyOLToxAkbbAoutVfo5Y5bgtakkxnc5++3uCSkgKPD7gq?=
 =?us-ascii?Q?uQWtMb6s3GIX5qi5sjeJSplEoQxzLQyIbOXj3DyyyHA0lfuFZPsxEPR23/sq?=
 =?us-ascii?Q?gAb4oOSV71yOASyM48nz4sSyQWUxjaq7yS6U+VsyTn+esaj320YW0X7Iu+mW?=
 =?us-ascii?Q?TbJ0swLK90y3efgzAydrX1KOjt/b5wBeVx87KOMfkoyrRJ9tgBdeRSp+7f2o?=
 =?us-ascii?Q?HY3wnC5ikam/8VYDdN3gMfaf2hShV94MXKjrNctaIV7lrxpJTvDUPsKg+alX?=
 =?us-ascii?Q?B+rxggBE6vvDDbZH0NPyBJwsFtvUBiEOfsjrnrOCc60/aAxvo4cLXwpJuwfx?=
 =?us-ascii?Q?VADAwT26T0SP9/w8YcyohZxPhmzjF+LPAeB/0mZXNYYQ/aIrQp5yTLUN1bDi?=
 =?us-ascii?Q?OivN7fnCFhnUQjjimyb5602gi2MUcaVzM66vCIiwHsUdWT4y3jyBwNwd7aOI?=
 =?us-ascii?Q?mD0QNUJuNl7+h+uUXrgeEBJGEYK0qD1VUWaNw4NhDNW6yuy/aCsb/viN/X7q?=
 =?us-ascii?Q?DDVSlUVm9Oe/fgnVl40TtZLNpDDIvqtcwhE8XrzcBIog+HV71xtdU1ml45M8?=
 =?us-ascii?Q?GMT0Uohk0CL+GySdudwF+sVyEeJAubTDdZ5Lnjo4MNBI+rBeQ1Sxlf+a3aRC?=
 =?us-ascii?Q?tVcHbYZLEisdvLnEcmPUWk7cm1qD3nUPyZMlH6+QdcdjDf5/AMnAdfzN0dRZ?=
 =?us-ascii?Q?qE2FempBdZ3l7UarQWztKSuOCEQlhRhrQN1XRCgRsYv1fbkDg6AvLYjZuD61?=
 =?us-ascii?Q?gw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7911bb12-48ed-4637-649d-08db0976e078
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 01:50:37.9209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: USPzVSIEQZbiQHTFc46gpAhSlrelv8zId5xh8xS/CV1vqATcqYEJzbmj3L3y1SYr5URep++KLP2paubkG4glQjCbFZQJqGXD6ubVJVAujs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR21MB3762
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
From: "Michael Kelley \(LINUX\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Monday, February 6, 2023 11:50 PM
> 
> Use more generic platform device instead of acpi device. Also rename the
> function vmbus_acpi_remove to more generic name vmbus_mmio_remove.

Let me suggest a slightly expanded commit message along these lines:

VMBus driver code currently has direct dependency on ACPI and struct
acpi_device.  As a staging step toward optionally configuring based on
device tree instead of ACPI, use a more generic platform device to reduce
the dependency on ACPI where possible, though the dependency on ACPI
is not completely removed.  Also rename the function vmbus_acpi_remove()
to the more generic vmbus_mmio_remove().

With this tweak,

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

> 
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
> [V4]
> - rebased which fixed return type of 'vmbus_mmio_remove' from int to void
> 
>  drivers/hv/vmbus_drv.c | 58 ++++++++++++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index d24dd65..7349715 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -12,6 +12,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/platform_device.h>
>  #include <linux/interrupt.h>
>  #include <linux/sysctl.h>
>  #include <linux/slab.h>
> @@ -44,7 +45,7 @@ struct vmbus_dynid {
>  	struct hv_vmbus_device_id id;
>  };
> 
> -static struct acpi_device  *hv_acpi_dev;
> +static struct device  *hv_dev;
> 
>  static int hyperv_cpuhp_online;
> 
> @@ -143,7 +144,7 @@ static int hv_die_panic_notify_crash(struct notifier_block *self,
> 
>  static int vmbus_exists(void)
>  {
> -	if (hv_acpi_dev == NULL)
> +	if (hv_dev == NULL)
>  		return -ENODEV;
> 
>  	return 0;
> @@ -932,7 +933,7 @@ static int vmbus_dma_configure(struct device *child_device)
>  	 * On x86/x64 coherence is assumed and these calls have no effect.
>  	 */
>  	hv_setup_dma_ops(child_device,
> -		device_get_dma_attr(&hv_acpi_dev->dev) == DEV_DMA_COHERENT);
> +		device_get_dma_attr(hv_dev) == DEV_DMA_COHERENT);
>  	return 0;
>  }
> 
> @@ -2090,7 +2091,7 @@ int vmbus_device_register(struct hv_device
> *child_device_obj)
>  		     &child_device_obj->channel->offermsg.offer.if_instance);
> 
>  	child_device_obj->device.bus = &hv_bus;
> -	child_device_obj->device.parent = &hv_acpi_dev->dev;
> +	child_device_obj->device.parent = hv_dev;
>  	child_device_obj->device.release = vmbus_device_release;
> 
>  	child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
> @@ -2262,7 +2263,7 @@ static acpi_status vmbus_walk_resources(struct
> acpi_resource *res, void *ctx)
>  	return AE_OK;
>  }
> 
> -static void vmbus_acpi_remove(struct acpi_device *device)
> +static void vmbus_mmio_remove(void)
>  {
>  	struct resource *cur_res;
>  	struct resource *next_res;
> @@ -2441,13 +2442,14 @@ void vmbus_free_mmio(resource_size_t start,
> resource_size_t size)
>  }
>  EXPORT_SYMBOL_GPL(vmbus_free_mmio);
> 
> -static int vmbus_acpi_add(struct acpi_device *device)
> +static int vmbus_acpi_add(struct platform_device *pdev)
>  {
>  	acpi_status result;
>  	int ret_val = -ENODEV;
>  	struct acpi_device *ancestor;
> +	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
> 
> -	hv_acpi_dev = device;
> +	hv_dev = &device->dev;
> 
>  	/*
>  	 * Older versions of Hyper-V for ARM64 fail to include the _CCA
> @@ -2489,10 +2491,21 @@ static int vmbus_acpi_add(struct acpi_device *device)
> 
>  acpi_walk_err:
>  	if (ret_val)
> -		vmbus_acpi_remove(device);
> +		vmbus_mmio_remove();
>  	return ret_val;
>  }
> 
> +static int vmbus_platform_driver_probe(struct platform_device *pdev)
> +{
> +	return vmbus_acpi_add(pdev);
> +}
> +
> +static int vmbus_platform_driver_remove(struct platform_device *pdev)
> +{
> +	vmbus_mmio_remove();
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int vmbus_bus_suspend(struct device *dev)
>  {
> @@ -2658,15 +2671,15 @@ static int vmbus_bus_resume(struct device *dev)
>  	.restore_noirq	= vmbus_bus_resume
>  };
> 
> -static struct acpi_driver vmbus_acpi_driver = {
> -	.name = "vmbus",
> -	.ids = vmbus_acpi_device_ids,
> -	.ops = {
> -		.add = vmbus_acpi_add,
> -		.remove = vmbus_acpi_remove,
> -	},
> -	.drv.pm = &vmbus_bus_pm,
> -	.drv.probe_type = PROBE_FORCE_SYNCHRONOUS,
> +static struct platform_driver vmbus_platform_driver = {
> +	.probe = vmbus_platform_driver_probe,
> +	.remove = vmbus_platform_driver_remove,
> +	.driver = {
> +		.name = "vmbus",
> +		.acpi_match_table = ACPI_PTR(vmbus_acpi_device_ids),
> +		.pm = &vmbus_bus_pm,
> +		.probe_type = PROBE_FORCE_SYNCHRONOUS,
> +	}
>  };
> 
>  static void hv_kexec_handler(void)
> @@ -2750,12 +2763,11 @@ static int __init hv_acpi_init(void)
>  	/*
>  	 * Get ACPI resources first.
>  	 */
> -	ret = acpi_bus_register_driver(&vmbus_acpi_driver);
> -
> +	ret = platform_driver_register(&vmbus_platform_driver);
>  	if (ret)
>  		return ret;
> 
> -	if (!hv_acpi_dev) {
> +	if (!hv_dev) {
>  		ret = -ENODEV;
>  		goto cleanup;
>  	}
> @@ -2785,8 +2797,8 @@ static int __init hv_acpi_init(void)
>  	return 0;
> 
>  cleanup:
> -	acpi_bus_unregister_driver(&vmbus_acpi_driver);
> -	hv_acpi_dev = NULL;
> +	platform_driver_unregister(&vmbus_platform_driver);
> +	hv_dev = NULL;
>  	return ret;
>  }
> 
> @@ -2839,7 +2851,7 @@ static void __exit vmbus_exit(void)
> 
>  	cpuhp_remove_state(hyperv_cpuhp_online);
>  	hv_synic_free();
> -	acpi_bus_unregister_driver(&vmbus_acpi_driver);
> +	platform_driver_unregister(&vmbus_platform_driver);
>  }
> 
> 
> --
> 1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
