Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCD563C36
	for <lists.virtualization@lfdr.de>; Sat,  2 Jul 2022 00:12:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E5083F42;
	Fri,  1 Jul 2022 22:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E5083F42
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cVEDxhXm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gL9U0ZM9EHbl; Fri,  1 Jul 2022 22:12:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4318783EEF;
	Fri,  1 Jul 2022 22:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4318783EEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C992C0037;
	Fri,  1 Jul 2022 22:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64316C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 22:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2190C60C03
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 22:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2190C60C03
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=cVEDxhXm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvumjqCjHLXx
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 22:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E29D60BDA
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E29D60BDA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 22:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6tXhKGoZbr4XeP4EQ1ybYIy72GZE40DjbqkoMO/Lynwefseu7cQCLrHifXBq53v7yHJKpkydyo5NfiTObnkucW5L28zY5dvMGT5fewQALk7rb/URYASgjhz8XYt/C8WieoEz2wSEdRQZdWBif0KbhFXgRXJFDsokM+z3jhErpOukbo7c6SaS+c5TeOpCtkpnzEAP/qWe6rl8HUuQtgHGZ7I+fJpV++zmW7WL8uC9zmyslAYwqGi3W/6A+GDeYYJ339l/g9T3Hf4+NAg+1QG+/L+MV/k0u/gacem6eqLosGNnUm6KH7RVGqO8ldaDUJt6C6wRrVhfrNslhcCN+4eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zef8L3Cw5hnJpkeAERTSLFRdgyuuiATe+oJy22ymd6w=;
 b=NgoLuUCnIxgNx0PRQD468QIRMxDfdqjTORkLmTeTPfkTIvD55cIPTfCoUuq2SQionGxYSrBJ5ELg0bdw7QMs1Oe90tTyiSnCw9uBMTGScNqNG6bGdra9LhJ108vuR0BnCbhrlWC3oj+/Ws1/Uy7fuJ0zTWa3hezBlTLnpEnvmGBmdtuMEiVnT8dTLNgp444HiOohl22jpF07ZdH6YtbQ6G33g3q2Maiz2mKDDyxcueRr9FiaO5UCRiMx5kQ/f+gyEAAKJ6M02OqBZA852WOIW8Qgnd28uSQn0e/hDrAnX3nLouXwyXHSFTqh1lwMVskjzW3kxjguJ3EdCSgmZjL3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zef8L3Cw5hnJpkeAERTSLFRdgyuuiATe+oJy22ymd6w=;
 b=cVEDxhXmbX22l61UvbZZpy9aAUEODQgYKgNJ6o7IL+FZNTd1A1J03ej+QZZmmWBLja6eb0W/NAeTpc+BxNI2owIpu1oF2qCne9UE/nBJSFkjaVkctN+I5+gN0Y5FaA2PsTsKOMI5e2PK8AKq0iuMV+xsMc/Vee5oqIiI6LlmTmKHSeJmeNR5dU1k5hIC/+mGmKGI0vaeyjWtSRhFuMEs33HY3FLopLTsIBLg09gSloMx1/bGnrWQebHEfQmRExgt4qsTMX9o7fFG9DoO1T6eJkDfW19eISzKXkCbvoAf0OF+ioOI8GX6mIsDMf/QE9iGG6PTKr6w9WAomCUFhD/rIA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 22:12:49 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::544b:6e21:453e:d3d6]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::544b:6e21:453e:d3d6%9]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 22:12:49 +0000
To: Zhu Lingshan <lingshan.zhu@intel.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH V3 4/6] vDPA: !FEATURES_OK should not block querying
 device config space
Thread-Topic: [PATCH V3 4/6] vDPA: !FEATURES_OK should not block querying
 device config space
Thread-Index: AQHYjU+N2FCBvYoo1k6WRMs2o5YCL61qFA6A
Date: Fri, 1 Jul 2022 22:12:49 +0000
Message-ID: <PH0PR12MB548190DE76CC64E56DA2DF13DCBD9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20220701132826.8132-1-lingshan.zhu@intel.com>
 <20220701132826.8132-5-lingshan.zhu@intel.com>
In-Reply-To: <20220701132826.8132-5-lingshan.zhu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30526226-4ac8-462b-10bc-08da5baed5d7
x-ms-traffictypediagnostic: DM6PR12MB4959:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +RYbQlcTg0J4Hb0eoNy8lonR+hoqtzwsQDhBqOlVhgupCnJVSK3bIz7fzrhrc5n0WBkie11UBguL7PefHeDSkjGdGFCZeCMDXyR8JAMYf27rkOyGPyg/QEaNccgGcCWckESA0YYVD7zVAvcRr4Az+v5H0d3DK1ybsvIlNfwM8zAc9sZuiv4ROpNa1j2gfagKbRuQE/i8GZy1RIQukvf41InwWwEmqSFlkp274UVhri3g+bRJ0BGxZlAzFrSClzbYChmPRdl6DZ7wklLuUbaVNswQdZL3CagdEYnuZ4h3/aNa1PJU64IMELICuOYdGyZeBWOAKozgMDCxe6IrgwdrNcfJLP40a7vUmm8Rr/xKUEjUmm8OOyiAar0egY3GhNnRGAiznWYIv7xu5g0jn+CkfnYjya3nYoPaEsC/0TWqs1dPhIYcrvJ3nfaMVxMuJNdpnckczZuINJCmEOVequVaBuypek7Dmcp7/zxT7L1bXenFuzMMGp+Yk4AFt/8W/3u3InPyQZ+eVSX1tFScKHYCQLUZmzfOrjxnkJIRsKsQsxKThol5paJb6c802d59/E27q58RiatYPbfpBt42lTBR67x/oZ73pDvy5QWzXDM2AvvR8kY6y7wDtCoQnS27DIxGsaylcGrPjnVVlW2ZvtIbzIVRMkKf8hoIneDq1wzec8+gxLuoRiaJpS4fbl5lHZmfbwHMHCZQwi2e5pPySovyEkOGpX8gSw1PkXxMgygP2rvRayDc4eXr23fdTWd4x/xd5BB1OsgJGoCL28VhUixBaF2kghcgIPG519kAyGpfvOKryrN804R7PEtx9uRbdpXy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(26005)(9686003)(83380400001)(478600001)(55016003)(71200400001)(2906002)(52536014)(8936002)(5660300002)(33656002)(7696005)(6506007)(41300700001)(8676002)(54906003)(86362001)(316002)(66446008)(64756008)(122000001)(4326008)(66476007)(38070700005)(110136005)(76116006)(38100700002)(66946007)(66556008)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n6UCmHGHX1Foi+z/vgXPMnLWlHyVEjykihBa6Iw3UoD7+0vQYjFzW+4UHyLZ?=
 =?us-ascii?Q?GS+wjicSBHZIAFHqwpUIu1Ngm5UKaOs75irAKDURdd7+OXGJeGCq2k35/F+y?=
 =?us-ascii?Q?x9YtmVTqsSqkBN9iSL9ElPmKNxAITiap/q7wy/FL6VWxsN4W+xtkZ3UNba39?=
 =?us-ascii?Q?a7VreTo5VK3hsaNdmtnx3Zwv5N3Cm/YU7UKQnRtTF6rl1Cq5XI1OyBUMSZX0?=
 =?us-ascii?Q?/fa8C0Q7fdHmFi/ukMZXdZAMEy2FQ13bVmDijrDrfrCk2ddc7uXQYQ6Iic4Z?=
 =?us-ascii?Q?oGM8uffNULQAdH6a4yIEvPakA+vgkVrAaTOd9ZTINVh2bH4nl7xSbH2fkNqJ?=
 =?us-ascii?Q?iiCXIhAwHyLCxdNkKsdQgViWjia3/WTyL5Toc4QdyLW9vcaRNCfNpA+3sRNX?=
 =?us-ascii?Q?xc3MjWymXcYRc66R8v02GsDz05h0I/Il56f+evATVLuetqc3DgFKp9CY2Srn?=
 =?us-ascii?Q?Pt4QcVz5a181dIyB+K8EDYkUvi611lff6luBZkoEl2VVXKzhFGuYF2NwMCOz?=
 =?us-ascii?Q?awUdAVLf3rt0LyfuGYp68EVJZjI0RAB4M27SID+QrmX4x5iyliS1e2huXh+x?=
 =?us-ascii?Q?u7NHII27hj0wfDl1nQ7ZdqV/3DqI8WxxC2rjN1oin+EcuAa8fkekjEdEePWU?=
 =?us-ascii?Q?ddx0EmqkM/J34Ok/wLx9JMGZjFSwpskm0cd2l32EBqyU0sxFqLJfBxi5LmVP?=
 =?us-ascii?Q?ZZv4dyGCqD5CnNrdmaTBbr/EGuXlrVHKgEp5Ms6J6N22ukqWhUIwP6XF9iRV?=
 =?us-ascii?Q?UdfxkzewWQ7oeEeyFtJwQleB4xc4LbPw8+ECrsb0Fjn74jUnUwQZSLdXfCv2?=
 =?us-ascii?Q?WLziX3plifc2hwpzV5DRVMG7umnVj05CzYPaBrRXiaGjQOnuF8XIKUNHx/5E?=
 =?us-ascii?Q?KKuey4inYMxs57IQlXtMHgleIrgoEWBmSiVOcewT4ZrIE/4aMhKnX6A1zNIi?=
 =?us-ascii?Q?CN6l1p0zP4/rB38J3pianFSFidEXRXuYbGLHpFG9bSj/93V38RSfxs9lOCgN?=
 =?us-ascii?Q?OLWm3bBq/+y5zuQGrbTdru/KOfPKu/AYrt2NxRQJ7YkNULa85MKkHmw4MeVi?=
 =?us-ascii?Q?rdhhZ3gQvL6QZYTU/ksd9htm3FJ8bXLEs2ug4B9bI5iE3Rw7toLZw7yFz26N?=
 =?us-ascii?Q?JY89SnwogIvEcuLkd7Yvd87+Kt7hKgb8Tz4M9eq6c3cJP4c49qdpVE1SLW0s?=
 =?us-ascii?Q?pkwtNLIIN50DOZ25ZMiDSbMs/kXV8j0N7e6ksrWPjaJxAjpDSXP1XqKr09fR?=
 =?us-ascii?Q?iGW4y9P3zIlJdzEKbOklqvIN5EIQF6nCZfx+14XNVdp60olblOj9PMoBsNgA?=
 =?us-ascii?Q?l6ASWELMglPFlJ0TmIIEaCWk3TEG9tTE2umVp5exn7+1j0CMxc5c/kz7+hrY?=
 =?us-ascii?Q?aRdHiM88ha0X1UqeEFoo6CVsASY9S6GfyfBX7i977AtVBFrgg9j0khMGQSAe?=
 =?us-ascii?Q?Ys6H0RbK94dJ6kAtyrlCthJA+zjp3j/X4MllVQe+soHvXge4yECQIAys6zHv?=
 =?us-ascii?Q?KSDN3gmmyNIhJeYkHO2X6apcJe2F4liS3UIHEbOnuSCHSObLeLwjGTT7CVVy?=
 =?us-ascii?Q?3bg7SqN2wOzbPP5gR4A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30526226-4ac8-462b-10bc-08da5baed5d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 22:12:49.6112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18m6Rdru9XudnA5hlYUs3AXO/6k291Xt9jD4HTY5MhyGD8y6+jFNN+4eHSlfeh45aW3FXb2GkBGlLuzB9i8uRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "gautam.dawar@amd.com" <gautam.dawar@amd.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
From: Parav Pandit via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



> From: Zhu Lingshan <lingshan.zhu@intel.com>
> Sent: Friday, July 1, 2022 9:28 AM
> 
> Users may want to query the config space of a vDPA device, to choose a
> appropriate one for a certain guest. This means the users need to read the
> config space before FEATURES_OK, and the existence of config space
> contents does not depend on FEATURES_OK.
> 
> The spec says:
> The device MUST allow reading of any device-specific configuration field
> before FEATURES_OK is set by the driver. This includes fields which are
> conditional on feature bits, as long as those feature bits are offered by the
> device.
> 
> Fixes: 30ef7a8ac8a07 (vdpa: Read device configuration only if FEATURES_OK)
Fix is fine, but fixes tag needs correction described below.

Above commit id is 13 letters should be 12.
And 
It should be in format
Fixes: 30ef7a8ac8a0 ("vdpa: Read device configuration only if FEATURES_OK")

Please use checkpatch.pl script before posting the patches to catch these errors.
There is a bot that looks at the fixes tag and identifies the right kernel version to apply this fix.

> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  drivers/vdpa/vdpa.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c index
> 9b0e39b2f022..d76b22b2f7ae 100644
> --- a/drivers/vdpa/vdpa.c
> +++ b/drivers/vdpa/vdpa.c
> @@ -851,17 +851,9 @@ vdpa_dev_config_fill(struct vdpa_device *vdev,
> struct sk_buff *msg, u32 portid,  {
>  	u32 device_id;
>  	void *hdr;
> -	u8 status;
>  	int err;
> 
>  	down_read(&vdev->cf_lock);
> -	status = vdev->config->get_status(vdev);
> -	if (!(status & VIRTIO_CONFIG_S_FEATURES_OK)) {
> -		NL_SET_ERR_MSG_MOD(extack, "Features negotiation not
> completed");
> -		err = -EAGAIN;
> -		goto out;
> -	}
> -
>  	hdr = genlmsg_put(msg, portid, seq, &vdpa_nl_family, flags,
>  			  VDPA_CMD_DEV_CONFIG_GET);
>  	if (!hdr) {
> --
> 2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
