Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453254EA3B
	for <lists.virtualization@lfdr.de>; Thu, 16 Jun 2022 21:36:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D08401E3;
	Thu, 16 Jun 2022 19:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWUH_LTcMn2H; Thu, 16 Jun 2022 19:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DCEFD40330;
	Thu, 16 Jun 2022 19:36:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63B03C007C;
	Thu, 16 Jun 2022 19:36:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F24CC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 19:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 680F9401E3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 19:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r46lL11ndOxE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 19:36:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::605])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB7D401CA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 19:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGJvc2UTKhIPvbaLVieejdItQ0Mk4dcp2DzUVGYq6SdYNvzHOSvbBCLn62xS5Be7oCnsibfbpqG5Fzl6rXREWgDaXmRX5tqGuNUArumlfIi9UALIOdwV2NyqZ6MxWKpS/A9wCnfZRIcf50YQ6Y9QFLI7pNdSUzzOm9E4KaG/+rXWSVy0CiptQO98gQvNh5JNSxXFqsESIoYYSbm0wC+9In/XkpV/J6FZz0/GN/mRlzE3vUoLCX8EVv9TcLe0WtRb8Jbl/Djidx14aER8ch5u/890JJb8O2SqJ//xTD0MSADUVHA7nCVDTh4dMSEr/prWWx7HEaMsd69nUxrCeAvI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxhAg+iFtErYBTmY4Iigi6gz1G3A417iEUROQ37r+2I=;
 b=VUsgDQehhBV5w9vqPS+EhuFn6LqpcPgy7vY3vM9V4thMbdTPlDx6vooDERqrodfu5unM29/p3Fd3AX3pbDM7KbupL71rsdgmtHzjRnL5pAXiy7VNEeWFxQ5R6t9HCaHvC1BKcfvvHWhbpFyvmLSjDmk98RdMtp+LRHnMFn3cXBHt74rt2RBId75RLzTE7zzyXfM9NA/INlMSgddQ6OBuvhZ9IXDlruRaHUi3QS4ey6oD/6W+HKxjmvih1UK3ZiD4v+CGWy6DRDoixspxgfk6fWWwpIybhcM8kv0i60zfj9FmdjybONxncYp1xQ6f8LceKbW+AUFmUn7TTPKiAbCu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxhAg+iFtErYBTmY4Iigi6gz1G3A417iEUROQ37r+2I=;
 b=YiwTn7upyxudhEqYLGMmpc5QYIr9UAWLhptcctWUJe8YHKdGwqx89j6ARcREhr5IWWS77iYgUys2TcHc21zTDewnbM/gOee4AZ7NLrTPXZ5fQkd6PnARsOhJw8zBkppiLdFkacttr11Bldv+WTPnJdK4NRDfDju98mt4CtP68mJebTNHc6XOAkBdWKfQSHtpx5yEssb53UcYjyJqM6IkfoHfGCKfMuV2hXxncU+YsfCxHA5gRzAS4ZYDvOL8y4pfbsuosr3pMfjLFmQkv4iDN+HAqHhnmoCt85EvwYby7Qnb4JLNoyo6JkzlyK8AU/4SJhe+JznUMeeC3aXwsT0Fzw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by BYAPR12MB3366.namprd12.prod.outlook.com (2603:10b6:a03:db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Thu, 16 Jun
 2022 19:36:02 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::8c53:1666:6a81:943e]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::8c53:1666:6a81:943e%3]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 19:36:02 +0000
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH v4 0/4] Implement vdpasim stop operation
Thread-Topic: [PATCH v4 0/4] Implement vdpasim stop operation
Thread-Index: AQHYcP5BrBz66eonZEeOxjwIzt98aa0xHKkwgAFx+gCABD0SgIACqRJggABroACAAQ+R4IAAdxYAgAAMy4CAABLZgIAULSmggAAYr4CAAqccMA==
Date: Thu, 16 Jun 2022 19:36:02 +0000
Message-ID: <PH0PR12MB548104990A5544C738A5A95BDCAC9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20220526124338.36247-1-eperezma@redhat.com>
 <PH0PR12MB54819C6C6DAF6572AEADC1AEDCD99@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220527065442-mutt-send-email-mst@kernel.org>
 <CACGkMEubfv_OJOsJ_ROgei41Qx4mPO0Xz8rMVnO8aPFiEqr8rA@mail.gmail.com>
 <PH0PR12MB5481695930E7548BAAF1B0D9DCDC9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsSKF_MyLgFdzVROptS3PCcp1y865znLWgnzq9L7CpFVQ@mail.gmail.com>
 <PH0PR12MB5481CAA3F57892FF7F05B004DCDF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJJL34iUYQMxHguOV2cQ7rts+hRG5Gp3XKCGuqNdnNQg@mail.gmail.com>
 <PH0PR12MB5481D099A324C91DAF01259BDCDE9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEueG76L8H+F70D=T5kjK_+J68ARNQmQQo51rq3CfcOdRA@mail.gmail.com>
 <PH0PR12MB5481994AF05D3B4999EC1F0EDCAD9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtRTyymit=Zmwwcq0jNan-_C9p70vcLP0g7XmwQiOjUbw@mail.gmail.com>
In-Reply-To: <CACGkMEtRTyymit=Zmwwcq0jNan-_C9p70vcLP0g7XmwQiOjUbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94a81eee-44e8-4879-2bea-08da4fcf72b3
x-ms-traffictypediagnostic: BYAPR12MB3366:EE_
x-microsoft-antispam-prvs: <BYAPR12MB336615F64B1B10CA474D2C3DDCAC9@BYAPR12MB3366.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oJQS8s+k1umfmQFZmOxmYD1QYp4IwLcgYBLyar4i01PZqehtUuZCTZmVxICvTkxdTUqrGT4yY56rR3P7LAG2phlfyAt40w+NKCjOUfAMGwYj9F1h30x28i2rQ2FfLcUtjJ41f92RkTBKzJDsYeQnuldr2D5Cv6x/q7Ab9t/P20nqTKN3/H36WJftHfVDh2hKZzXyQpvfOqrKU1dG2fzU9MOYRMzeNTiwHRi3UztweHVXmfdiLAKhd2S5I8cavMwSilLikXsHvC+Rtvv670Dhqy0JpJlxk13TU1jdsZDVNrMPATv7DELoKObPtGA0VEMkBHVFKOAB3FXQAZ6bpE0ln6rxPvArCOdlyloGuMi1T8z1QNpJ1+JapIoOEverrVYyMPewOgTP4FTdIf/n0iFHfdeJaQoE+sGGNraiwNjYtmhHDRE2878XXfwre3FISoCdPJK+2G8Bbpt0D4iws8fMgU42l5O5KYTaxp1k9A1LXtkdiQo/WwJO7dwT3uLU9hzz1DZ2SP0ybAUqS7H8OPtif4r8r+MmvbefsmdRqz2rcxUPvfwwXvqcVWtnvmwoa2P4dnceFsgJi4Sv8cPXQXXNhNgQ7YMfUodZQM1MWaNLI5bjo2RAPvuRa74mVrCANZ1ZE/m8CxTTIISVLhF+syJrC+QS+5Q/O0eMdjOcM7HG8AgBoaqRaSPbNtjT97nJ7l0VyIZeIN82JzUSvtdGhdjNVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(55016003)(54906003)(2906002)(8936002)(9686003)(52536014)(7416002)(122000001)(5660300002)(33656002)(83380400001)(71200400001)(508600001)(186003)(6506007)(38070700005)(26005)(6916009)(7696005)(38100700002)(4326008)(66476007)(66556008)(66946007)(8676002)(64756008)(76116006)(86362001)(316002)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG16ZFV6OHlaZFF4dkZ1MVY0OU5RcHFPaGwrelNmQ0JuWEM1cEhHbU0wWWpW?=
 =?utf-8?B?ZEYyOWYzaW0yTm9zVHpBOCttVWlEZjN0TW53dXV4bXNyNFNZWEhkbkVFaG9w?=
 =?utf-8?B?N2Q5UmIwemFjdng1WnpLdXVZYStWdVNPQ3NBc1QzUWtwS0hoNDhDLzJyVkI1?=
 =?utf-8?B?cTk3VWwyeEZOb0NlWW5nZ000MWV2WHNxaDRITjZkcVNxYy93RXhjU2FhbWhQ?=
 =?utf-8?B?amxZRUxJcTg1OVp4N3VIN0lMQ0NHVG9zNHJuYnhEeGRzaFczcUdzVUlTOGZI?=
 =?utf-8?B?TFJKT1NpOHFObzFFQVd4UUJiL0RNTC9ha01LYU1mb1gwTk9WbUM0STM2N2Yz?=
 =?utf-8?B?L0NjS0thRTRZNjVMRXJUZlphOEwxMzZHRUUyNE92eVZoZGtTb2Q5RmlkT2xv?=
 =?utf-8?B?d0hhM3NiV1QrZnJaaWk4T1RPLzkvVUtVYVpIdTkySUhVM3FxMEVjNnZBM2Fu?=
 =?utf-8?B?UHllS0QrNUcycnNrTFJHTU9WZ1lIYVJQWTR6NnhNNk9VL0M0Z3RrbFY2Nkp2?=
 =?utf-8?B?SjRxSHlrSm9KakIwOHR2L0tZK24vdjRZYm83MGwrbzU1M2h4UFJWRTQ2SXlo?=
 =?utf-8?B?QlRZRVU5WThXc3RTMThrbXpZTDc1b0UzKy8yU3lHSDNhZzdlalU1MEhxYURl?=
 =?utf-8?B?bDkrZmI5YXhZQ1hhMUh5ZThHODNoSU4wRmhXU0FGVER0aisxdDBqeE1EbDNH?=
 =?utf-8?B?aTB0MEdKWHFBbWM0c0dReThsVjZKVWJkcmtZRkNoRXVxcWJHZGM2MjAzMmtD?=
 =?utf-8?B?c3V0bThjaDI0THI0VE1LSWRQZlFDR2MxQVRXZU1PNUoxRjF0cHN5U241eGhK?=
 =?utf-8?B?cFdEWmxXQkYvUWNzNmlma0Z3d0ZYZGd6MzdVV3AzbXBVdTloRUo2UUFqL2hs?=
 =?utf-8?B?SnF2cEJOenFybUI3MEkrS3pIV0V0S2EyYm14N3lXOEZsd2x1aElybmNJVGh1?=
 =?utf-8?B?YzhLSjBVUXlUek9Fc200a25VMjJ4Szc2SlhFcEYxWGF2Y1hKeXVDcmkzdlBz?=
 =?utf-8?B?YW9lMWdhMVVGUnphdnlGVlpJa1lKYVdueS91bHZhMHFwV1pIWFh3YjlGRTh5?=
 =?utf-8?B?RDFick0vNXNxdEI3bmF4OFlQOHNJbiszbnZWL2wyWThPSzZsTzVMTzA2ZmlX?=
 =?utf-8?B?ZW1NL3ozd3BBY1VJdEZBcmU2WXBEd0RoekNKSG9sOGNvVTc1MExFSnBFT3ZN?=
 =?utf-8?B?aXlsQmZvcHZZNXZ3cEhYWEplZWxuQm5pbWNmTCt4MlNiU1RFcVp1b2dZdk9V?=
 =?utf-8?B?djIwRXdEdGFmZG5MM1BlV1pKTmt1RUEzV3JZc1k1Z2E0ZzFqSXVNWnNjOE81?=
 =?utf-8?B?dzA4c1ZBTngzaG1IbmRBSGZ1MUFhaE5iNmxtZTh3QjJ3dXN6a2dGMDZzeFh2?=
 =?utf-8?B?NkxKRWYvdzNldTB2N29zUmZHY3ExbGVUdTFNU0NvUlJPSVBoZGxOL0JFcUYv?=
 =?utf-8?B?aWJmT1cwYW1lVFZ1eDZWVE9tZVk0dVdDc2tiWmZjR3FENjAyTm9FVWpQZ2lV?=
 =?utf-8?B?NzFUWDZveW10di82SkVWWkh3N0xFcWhHczIzdURSRGRRWmNYSnExemVKbVRI?=
 =?utf-8?B?aDNiNUlmeFo5eE9yamlFSnZvQTBCeVhxbGlJODZrbHJ6eWxMTkVRMVBPTVQ0?=
 =?utf-8?B?SzRyditaOWwxTmE5TkZxNFgvckM3cnE5NTZ2Z1cxYzFqaVlKVWdqTU8vSDBy?=
 =?utf-8?B?M29NbXBFKzZmOU1sakRnNU83ZXdWdHkzQlBjbXBTVWZvSGRlYTJ6TkgySnBk?=
 =?utf-8?B?Q01zK0FHTlFtdWRKOTdySk13L0JjNEdYQlRRa2x6Uyt1ejI3VlZ3N0V4QXE2?=
 =?utf-8?B?ZjZacDlMRlViWnJkMFBWd2ZmeHRGNEV6VzBBU0p6NTVFcWgrQWllWmdDVDlI?=
 =?utf-8?B?dDZ5dEJkTGtCZ3NUbEhHUlJjajBTOGFzTUlPU0RWNDdFQnhkK1RLc0Njei9V?=
 =?utf-8?B?c3B2cEFZcWJZdytUUGwxMXowYkZZalpXZFpTT0QyYTM3MENPckZ6SFBSamVW?=
 =?utf-8?B?dVBtY0VBU3czWlJwWFVxQjU1dXl0MFVyd2RnQUlCdXZGWkVMeDJTQ202aTdv?=
 =?utf-8?B?MWtvS3QzNHJlUU0ySVJidU1SU0tHbHZxSGlrSzFrcU1hWjVVSkNVRE80K09Z?=
 =?utf-8?B?ZmdVM21veW50a0luaURYMzQwcmtaQTdRZXkzbzN6ZTg3aEhPaFpSM1oyNXVo?=
 =?utf-8?B?WlJhVWF4UHBOZzFUdXM1VEFsQ2cxZ1ZmVUd2b2l5bDJGTVBYTkk4Y1FaaUlC?=
 =?utf-8?B?OUg4ZG5tb2hBWmRUSHhlRHZaWXpMWTVybjlRNFg4ajhCS1Fydlc3REo1YzRD?=
 =?utf-8?Q?6CHdftWHJiByIlOiNa?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a81eee-44e8-4879-2bea-08da4fcf72b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 19:36:02.7359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0f5B7qMcKdGw+Iev28PE5nw4u/vELRxpeDpsnlfsrNQWmeCcrk9huXs+hhSO8/nmvsy8SRaCDtZgsDtqNaONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3366
Cc: "tanuj.kamde@amd.com" <tanuj.kamde@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Wu Zongyong <wuzongyong@linux.alibaba.com>,
 "pabloc@xilinx.com" <pabloc@xilinx.com>, Eli Cohen <elic@nvidia.com>,
 Zhang Min <zhang.min9@zte.com.cn>, "lulu@redhat.com" <lulu@redhat.com>,
 =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "martinh@xilinx.com" <martinh@xilinx.com>,
 Xie Yongji <xieyongji@bytedance.com>, "dinang@xilinx.com" <dinang@xilinx.com>,
 "habetsm.xilinx@gmail.com" <habetsm.xilinx@gmail.com>,
 Longpeng <longpeng2@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ecree.xilinx@gmail.com" <ecree.xilinx@gmail.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "martinpo@xilinx.com" <martinpo@xilinx.com>,
 "gautam.dawar@amd.com" <gautam.dawar@amd.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEp1bmUgMTQsIDIwMjIgOToyOSBQTQ0KPiANCj4gV2VsbCwgaXQncyBhbiBleGFtcGxlIG9m
IGhvdyB2RFBBIGlzIGltcGxlbWVudGVkLiBJIHRoaW5rIHdlIGFncmVlIHRoYXQgZm9yDQo+IHZE
UEEsIHZlbmRvcnMgaGF2ZSB0aGUgZmxleGliaWxpdHkgdG8gaW1wbGVtZW50IHRoZWlyIHBlcmZl
cnJhYmxlIGRhdGFwYXRoLg0KPg0KWWVzIGZvciB0aGUgdmRwYSBsZXZlbCBhbmQgZm9yIHRoZSB2
aXJ0aW8gbGV2ZWwuDQoNCj4gPg0KPiA+IEkgcmVtZW1iZXIgZmV3IG1vbnRocyBiYWNrLCB5b3Ug
YWNrZWQgaW4gdGhlIHdlZWtseSBtZWV0aW5nIHRoYXQgVEMgaGFzDQo+IGFwcHJvdmVkIHRoZSBB
USBkaXJlY3Rpb24uDQo+ID4gQW5kIHdlIGFyZSBzdGlsbCBpbiB0aGlzIGNpcmNsZSBvZiBkZWJh
dGluZyB0aGUgQVEuDQo+IA0KPiBJIHRoaW5rIG5vdC4gSnVzdCB0byBtYWtlIHN1cmUgd2UgYXJl
IG9uIHRoZSBzYW1lIHBhZ2UsIHRoZSBwcm9wb3NhbCBoZXJlIGlzDQo+IGZvciB2RFBBLCBhbmQg
aG9wZSBpdCBjYW4gcHJvdmlkZSBmb3J3YXJkIGNvbXBhdGliaWxpdHkgdG8gdmlydGlvLiBTbyBp
biB0aGUNCj4gY29udGV4dCBvZiB2RFBBLCBhZG1pbiB2aXJ0cXVldWUgaXMgbm90IGEgbXVzdC4N
CkluIGNvbnRleHQgb2YgdmRwYSBvdmVyIHZpcnRpbywgYW4gZWZmaWNpZW50IHRyYW5zcG9ydCBp
bnRlcmZhY2UgaXMgbmVlZGVkLg0KSWYgQVEgaXMgbm90IG11Y2ggYW55IG90aGVyIGludGVyZmFj
ZSBzdWNoIGFzIGh1bmRyZWRzIHRvIHRob3VzYW5kcyBvZiByZWdpc3RlcnMgaXMgbm90IG11c3Qg
ZWl0aGVyLg0KDQpBUSBpcyBvbmUgaW50ZXJmYWNlIHByb3Bvc2VkIHdpdGggbXVsdGlwbGUgYmVu
ZWZpdHMuDQpJIGhhdmVu4oCZdCBzZWVuIGFueSBvdGhlciBhbHRlcm5hdGl2ZXMgdGhhdCBkZWxp
dmVycyBhbGwgdGhlIGJlbmVmaXRzLg0KT25seSBvbmUgSSBoYXZlIHNlZW4gaXMgc3luY2hyb25v
dXMgY29uZmlnIHJlZ2lzdGVycy4NCg0KSWYgeW91IGxldCB2ZW5kb3JzIHByb2dyZXNzLCBoYW5k
ZnVsIG9mIHNlbnNpYmxlIGludGVyZmFjZXMgY2FuIGV4aXN0LCBlYWNoIHdpdGggZGlmZmVyZW50
IGNoYXJhY3RlcmlzdGljcy4NCkhvdyB3b3VsZCB3ZSBwcm9jZWVkIGZyb20gaGVyZT8NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
