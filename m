Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 651487B9CEC
	for <lists.virtualization@lfdr.de>; Thu,  5 Oct 2023 14:16:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327DD41F0B;
	Thu,  5 Oct 2023 12:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327DD41F0B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m3XjG+EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zT_Z7w8Ni-Nv; Thu,  5 Oct 2023 12:16:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 430CA41F15;
	Thu,  5 Oct 2023 12:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430CA41F15
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7709AC008C;
	Thu,  5 Oct 2023 12:16:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7AEDC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7304A41F0E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7304A41F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovPIFkIUIwwA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:16:16 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D347E41F0B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D347E41F0B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHWvMGcazopsJ2p18soxm4IKC1+IHCxIN46ak47x/7iTXIaQUYfSCcg2OQGPJwVqAQauTrlsqlzLBdIBLpd10ghKtBUz4Q8tVxyPRZjyTfGcBD6rnDLcFyNs5mayheSPGD/2v5o4oLbhSB8TzPfRL2x6ZF9b2b0jbbvkxnAXU26h5294+ZbWmUBUrqpBhdGRS/FA9ljP0SpfqN29RAyMT16LPuK8pcyM1qf42AH6GUFu7kfFx8M7DoDiEzUtQzrKg8blAXqd3sGcjsMZ+PV1zZJz3E+ALugc+Keh7wVASmee7jSZU/NNeuZ/4xDrBQFGUPR5We0kJfSX5XNy+pIaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQuyO7kVi9nxv+PmiCSvnYypWhEFwFKpqWtd2Idy3j8=;
 b=I0qwSzWsHHSeCOh5eW2Tq4nqgt7JJYBjdOeTHZv7k6GqnBRzo0fcpHyNE1WgUEh2FIO1YCrcYH/CEhRXRaj/RhyA9O4/8FTaPEd7UCw5vQkBITwltk2+eBMDUbFkCSr4k47swukdSURTlRBkykz+DgbyItHjM9bg4a8U0KbcGa8ct/X8p/TbIpbKBWhF3dmuJUmYZqFgJ7RY5TPi2bPYu8NoD9b/LmEwbetyYJVmvkiJdspSNifTiOzzkj4krjQv4XmxqtYWFDlM/bhNW2r2bVbAutMFAHFO1XUInmwiud4QSaijdXhKfcN+k2DKdp0OXQicLKiZj/L0nkoqn7n95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQuyO7kVi9nxv+PmiCSvnYypWhEFwFKpqWtd2Idy3j8=;
 b=m3XjG+EAaIL6nQSGmrV8Bv/7z4Zcx3/kaFH8wB685wQHEc/tRrNbUJyabV14hSGXmVuieRr5dqCsfYoh1DHYy1eel4JiASv8BZ9XGGGJNwuT8uPD702KqfLjdeLT19LLAuam8JVS6fVtEc5ZhBpO0whcYO7EXOxRPSWhQ3U2sZpy+cHYwBJge/w0lAhhdvWIrWWLlQ6r34g8tOiAbIK5MhQaiv1Z9oLrTixJE9Xiqk68qTLwK+bPH00qy1YHwgvhFQla1/hezzDknhpI1i4AL5tW8/YokMc46LBqN7tV3YUGSXVXTP4HCI69bc0Ylvva8lOok9AixzPAXG6N6veZkA==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 5 Oct
 2023 12:16:12 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 12:16:12 +0000
To: "eperezma@redhat.com" <eperezma@redhat.com>
Subject: Re: [PATCH vhost 14/16] vdpa/mlx5: Enable hw support for vq
 descriptor mapping
Thread-Topic: [PATCH vhost 14/16] vdpa/mlx5: Enable hw support for vq
 descriptor mapping
Thread-Index: AQHZ8ivdsWEn1DPUgk+BYEwCXHDetLA6/CIAgAAq+QA=
Date: Thu, 5 Oct 2023 12:16:12 +0000
Message-ID: <9f0ef4ebd801a35873561384b2aedc920faecd03.camel@nvidia.com>
References: <20230928164550.980832-2-dtatulea@nvidia.com>
 <20230928164550.980832-16-dtatulea@nvidia.com>
 <CAJaqyWeRhJNZ8wbpEFARwBBNbE07n4xQdd-RvUoZooCeB4piPA@mail.gmail.com>
In-Reply-To: <CAJaqyWeRhJNZ8wbpEFARwBBNbE07n4xQdd-RvUoZooCeB4piPA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|CY8PR12MB7313:EE_
x-ms-office365-filtering-correlation-id: 47fdb92a-ccbb-4014-7bdc-08dbc59cdd4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8LxwNTub/5kMB+0Ij4VBfawPNYwvW7d7o6OkOt3S8KH0CZNIXl/KsLo6onGnbAnU4a43xoXHrzunkmCBGn8g7DmpiRILgNdMqXNSqbKnOYAVL1xEnCQPD94PcYTJzKUD37UzzVMbfCZO0K83h99AUswa65IBFpYI7VrillGq+9LMXQIoTgKxJxvJoU37W0Ybad2NfK9dE4itwyFBoR7pPyIKQB90qtGyUpH1SVix0cThbjUjey/S6LBRO3UXYNT5YFWNhvpoOdoZyKTGMcKr74fa091xBP8vqFVmmil9drx+JoHyBHUDd1Wc5CDpnboY59eq/0DXwGuQ8y+fPse28n+SoAKqe71Ft8wWHlw9W6kLE/7GNG2jZ7RJGlE1ft+ldbo39uWMwSnZSO8cxw3EP9B565IDc9tNL0gq+rnmX0/xjOZQP0AiQYd474ygahXcswW5NzVHFixL+IWzteIWf8iTyNLZExMU+vWK1wxsW8jpecwq1fe5oAyJMY1KCGepBzYqadogzNHdD1r0/DUaUvn7tM3dTtzxw/wSnjEr0ARC5liz34Ox3JKp4ZyWogPVCaWR2EGggyoiTRgF4zCRSEFMHsFayA37+9XsIpq+qIeDC+bWFQ/+eAWOncSPRE/S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(86362001)(5660300002)(2906002)(4326008)(8936002)(41300700001)(83380400001)(122000001)(6506007)(38070700005)(38100700002)(66574015)(8676002)(66899024)(2616005)(53546011)(478600001)(66556008)(91956017)(316002)(6916009)(76116006)(66476007)(66946007)(66446008)(54906003)(64756008)(6486002)(6512007)(71200400001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3p5OUhFMEtlUG54azFKUTF3QkR5eXVxN1UzSEJHTVRlbnp5Y2xYN21LMXRB?=
 =?utf-8?B?Nk13N3dOSitZNTdkSU9FOVBtWDJYbjMrQnN6ZVpONEpEY3Z1eENyVnpJUmVw?=
 =?utf-8?B?ZFA1QzlocVpLcGRnOWUwOTBuUXRyQW8zRG52d0hhaEgxZFRNMW5VVFo2aDBT?=
 =?utf-8?B?VmhjakEvaWppZ2RYZjludVYyOUVsUzYvTFR0WVJHZ0szSlZhYkVTVzZDaXZW?=
 =?utf-8?B?RVppSEQ3a1dCOFBBeG15RkN1TFZTV2VxclhXMmFLcTNlUGRxbDJzV3lKaCt5?=
 =?utf-8?B?cG16eVBVS054aEUyaVpxZG9zOE1odEZIVy9BZWJUV21nZVh2TEhSRERaWjBK?=
 =?utf-8?B?cGtCZ255UFhvWnJkT2hGRDI3TXVIMjhEVnhFZEoxZzhKc3p4ejd6ZEFDcy9H?=
 =?utf-8?B?dEFra1FFWmVoS0dCaGY0WmdWOEd1bTluTEJ3YjcwOTFaRzBkYnh0RDZRUXlq?=
 =?utf-8?B?VG12OW9TeXRHeThsNW1xbkZZeDRGQ29WU1ZQaGMrcmU2T205d0VtZVVIM1hQ?=
 =?utf-8?B?KzVqZkhhbmhzUHFkdVVudCtndktBOHNlenFoS1AvQUxyV1g0UXhwL05NbjVT?=
 =?utf-8?B?eEZlTUU3clN3blViTjE3SVEzd0VPcjc2N3pjYTlFSmVlL014azdOTmNtdCto?=
 =?utf-8?B?NFhkZ1QzT05TRE9kRlhacncwMHQvUnpjSm1ZSXZMcVN0NUtXQlJzQ1RVNHBw?=
 =?utf-8?B?R2hIQkFmdjNXaldsQUlXcDV2bVovVlM3N0l0d3ZYQ2NEbmFrbys1ZjBPMXU1?=
 =?utf-8?B?RHZpUzI3QkJ0ckswTG9sanNmeXpvdGhSNSt1M25CQkFNbmVwdUhqc3ZBTUFG?=
 =?utf-8?B?M3drWjN6VHpTVE1ETHNYQ3BiMzNNMEdYdHU0a29aUUNoNDJISzlDUGI3TWVz?=
 =?utf-8?B?ZjhrQVVpY3VLV1B4bkpza1FhM1owSFEvOEEvT2UxUzJvNGVjbEJHSDZkZWNy?=
 =?utf-8?B?SGFkTmZEcGg4c2JCSjdMbXNub0c2SDhhTDhxUFk1UjA5V09qMi9Mek12Y2Nj?=
 =?utf-8?B?OUFoZFpYc3AzdmZKc1p4Y1Jvam9nZ2ZGUm5rL0loZmluekEzUTZlNVdOSlBV?=
 =?utf-8?B?Zm5CY2lNclBTNStRS1E3azNUa1p4QlRVcUxrQVljcFZyNys4ekdncG1OeENt?=
 =?utf-8?B?N0k5NjdTMG04MndmMElQNDZIVTVoVlZHTUs1VGtpbkl6UnNIbWVRaDM3YVZS?=
 =?utf-8?B?Vk1oWkJTdVA1UkYwT3I0VEhqWkVXaDVDMDhEQVpCT0Z5Ym1pKzFFZmp2VWRE?=
 =?utf-8?B?dW1mQTQ1NnRDOEtjdDlCY1B6czFscVY4U2VpalVpU3FFZVdLMHNNUUNIRXdm?=
 =?utf-8?B?clU5eVF4eDA5L3B0RnozMzJJT3Zlaktoa2JTV0phT1ozdnhWeWFhMDNZSDNs?=
 =?utf-8?B?SDZsSWt3R1pyQlZCQU1pNDZWQ05VN0taSUtseWliOWE0VmtGNHUyMzJINzVF?=
 =?utf-8?B?dmdEVmdIUjcvaXRRejZMYjVSS3Y0NElaMGZjc1NWcEluY09QS2dqNkVuakNi?=
 =?utf-8?B?WVgvL25GT0RjUHVRTWhPZ0hlK1FjelAxbnRZWWJERGxaaG9HRjZDT0trQmpn?=
 =?utf-8?B?dmJHcS93SyswZ0JocE1ZYzBDTHU3eThwbWdZYlphL3p4cFZnVGJMMmgzMGUx?=
 =?utf-8?B?NEgxemp0di9YeGQzNlB3SWlEaUMyaDFUZndoeCtDbE91bTZ1bTZGRW0xVlR4?=
 =?utf-8?B?N2xUeWl1OExab2JHWnBBK1FKS3JQTFZCOHBmV3BwMUxlVkFHdE5ZRTQ2TUUr?=
 =?utf-8?B?aG41TUZVNmR6Tzg2RS9RTjZnZTZpRDUxR2xiMGdlL3QzbTEzdWU3R2FiMmN0?=
 =?utf-8?B?a2dYOVh3Z1hJTzNscVFjY3JsU1Nia2lFdms5SlozOXZ5aWtOdlczNnNYMFha?=
 =?utf-8?B?aWtwN2tSUnQvRVdRUVhIUzcxejA2SmpraUQ1TTVhTVU0cjFad2gyZFQrenhn?=
 =?utf-8?B?WDB3THpMVXZqY1U3QWl6SXl1YVM1VzlGQ0RRdTNpVk1RVnpXcUJnb0ZvWTcr?=
 =?utf-8?B?RjgwVVlMbUgwZFFJY0d3eDBST3VEZml2MlVFZ25VTDl3S2VkVytYTUwyZUZD?=
 =?utf-8?B?cEMrcFB0U0ptS2hGZUFjWStGUjlxMU9aOHJ0OW51RzVRVFhKMFZacjVjUWhn?=
 =?utf-8?B?ajlVMEV1bkZhUjk2WU9NVTEramtuNXN1UWpmTzBCaG1HN0pVeDZoZjRUSFBP?=
 =?utf-8?Q?E6Uv8ftBl0MRhgMO/oN/nv+IPHe9ki3QatuR28tTjX3g?=
Content-ID: <DDB8D7FA6FE0154C88B768ECE88F2D0E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fdb92a-ccbb-4014-7bdc-08dbc59cdd4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 12:16:12.1373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9hE3E43ovP18DnQQZ5SOz37FpbPJkUdEGpMlwAEhO9JpGKnM70okYPOuCUow1fwdRXzlqFM+5HamlXdS8hJRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "leon@kernel.org" <leon@kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Gal Pressman <gal@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Saeed Mahameed <saeedm@nvidia.com>
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

T24gVGh1LCAyMDIzLTEwLTA1IGF0IDExOjQyICswMjAwLCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3
cm90ZToNCj4gT24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgNjo1MOKAr1BNIERyYWdvcyBUYXR1bGVh
IDxkdGF0dWxlYUBudmlkaWEuY29tPiB3cm90ZToNCj4gPiANCj4gPiBWcSBkZXNjcmlwdG9yIG1h
cHBpbmdzIGFyZSBzdXBwb3J0ZWQgaW4gaGFyZHdhcmUgYnkgZmlsbGluZyBpbiBhbg0KPiA+IGFk
ZGl0aW9uYWwgbWtleSB3aGljaCBjb250YWlucyB0aGUgZGVzY3JpcHRvciBtYXBwaW5ncyB0byB0
aGUgaHcgdnEuDQo+ID4gDQo+ID4gQSBwcmV2aW91cyBwYXRjaCBpbiB0aGlzIHNlcmllcyBhZGRl
ZCBzdXBwb3J0IGZvciBodyBta2V5IChtcikgY3JlYXRpb24NCj4gPiBmb3IgQVNJRCAxLg0KPiA+
IA0KPiA+IFRoaXMgcGF0Y2ggZmlsbHMgaW4gYm90aCB0aGUgdnEgZGF0YSBhbmQgdnEgZGVzY3Jp
cHRvciBta2V5cyBiYXNlZCBvbg0KPiA+IGdyb3VwIEFTSUQgbWFwcGluZy4NCj4gPiANCj4gPiBU
aGUgZmVhdHVyZSBpcyBzaWduYWxlZCB0byB0aGUgdmRwYSBjb3JlIHRocm91Z2ggdGhlIHByZXNl
bmNlIG9mIHRoZQ0KPiA+IC5nZXRfdnFfZGVzY19ncm91cCBvcC4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBEcmFnb3MgVGF0dWxlYSA8ZHRhdHVsZWFAbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4g
PiDCoGRyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuY8KgIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKysrLS0NCj4gPiDCoGluY2x1ZGUvbGludXgvbWx4NS9tbHg1X2lmY192ZHBhLmgg
fMKgIDcgKysrKysrLQ0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvbWx4NS9u
ZXQvbWx4NV92bmV0LmMNCj4gPiBiL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYw0K
PiA+IGluZGV4IDI1YmQyYzMyNGY1Yi4uNDY0NDFlNDE4OTJjIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdmRwYS9t
bHg1L25ldC9tbHg1X3ZuZXQuYw0KPiA+IEBAIC04MjMsNiArODIzLDcgQEAgc3RhdGljIGludCBj
cmVhdGVfdmlydHF1ZXVlKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2LA0KPiA+IHN0cnVjdCBt
bHg1X3ZkcGFfdmlydHF1ZQ0KPiA+IMKgwqDCoMKgwqDCoMKgIHUzMiBvdXRbTUxYNV9TVF9TWl9E
VyhjcmVhdGVfdmlydGlvX25ldF9xX291dCldID0ge307DQo+ID4gwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2ID0gJm5kZXYtPm12ZGV2Ow0KPiA+IMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBtbHg1X3ZkcGFfbXIgKnZxX21yOw0KPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0
IG1seDVfdmRwYV9tciAqdnFfZGVzY19tcjsNCj4gPiDCoMKgwqDCoMKgwqDCoCB2b2lkICpvYmpf
Y29udGV4dDsNCj4gPiDCoMKgwqDCoMKgwqDCoCB1MTYgbWx4X2ZlYXR1cmVzOw0KPiA+IMKgwqDC
oMKgwqDCoMKgIHZvaWQgKmNtZF9oZHI7DQo+ID4gQEAgLTg3OCw2ICs4NzksMTEgQEAgc3RhdGlj
IGludCBjcmVhdGVfdmlydHF1ZXVlKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2LA0KPiA+IHN0
cnVjdCBtbHg1X3ZkcGFfdmlydHF1ZQ0KPiA+IMKgwqDCoMKgwqDCoMKgIHZxX21yID0gbXZkZXYt
Pm1yW212ZGV2LT5ncm91cDJhc2lkW01MWDVfVkRQQV9EQVRBVlFfR1JPVVBdXTsNCj4gPiDCoMKg
wqDCoMKgwqDCoCBpZiAodnFfbXIpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IE1MWDVfU0VUKHZpcnRpb19xLCB2cV9jdHgsIHZpcnRpb19xX21rZXksIHZxX21yLT5ta2V5KTsN
Cj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCB2cV9kZXNjX21yID0gbXZkZXYtPm1yW212ZGV2LQ0K
PiA+ID5ncm91cDJhc2lkW01MWDVfVkRQQV9EQVRBVlFfREVTQ19HUk9VUF1dOw0KPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKHZxX2Rlc2NfbXIpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgTUxYNV9TRVQodmlydGlvX3EsIHZxX2N0eCwgZGVzY19ncm91cF9ta2V5LCB2cV9kZXNjX21y
LQ0KPiA+ID5ta2V5KTsNCj4gPiArDQo+ID4gwqDCoMKgwqDCoMKgwqAgTUxYNV9TRVQodmlydGlv
X3EsIHZxX2N0eCwgdW1lbV8xX2lkLCBtdnEtPnVtZW0xLmlkKTsNCj4gPiDCoMKgwqDCoMKgwqDC
oCBNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4LCB1bWVtXzFfc2l6ZSwgbXZxLT51bWVtMS5zaXpl
KTsNCj4gPiDCoMKgwqDCoMKgwqDCoCBNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4LCB1bWVtXzJf
aWQsIG12cS0+dW1lbTIuaWQpOw0KPiA+IEBAIC0yMjY1LDYgKzIyNzEsMTYgQEAgc3RhdGljIHUz
MiBtbHg1X3ZkcGFfZ2V0X3ZxX2dyb3VwKHN0cnVjdCB2ZHBhX2RldmljZQ0KPiA+ICp2ZGV2LCB1
MTYgaWR4KQ0KPiA+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBNTFg1X1ZEUEFfREFUQVZRX0dST1VQ
Ow0KPiA+IMKgfQ0KPiA+IA0KPiA+ICtzdGF0aWMgdTMyIG1seDVfdmRwYV9nZXRfdnFfZGVzY19n
cm91cChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHUxNiBpZHgpDQo+ID4gK3sNCj4gPiArwqDC
oMKgwqDCoMKgIHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiA9IHRvX212ZGV2KHZkZXYpOw0K
PiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIGlmIChpc19jdHJsX3ZxX2lkeChtdmRldiwgaWR4KSkN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTUxYNV9WRFBBX0NWUV9H
Uk9VUDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCByZXR1cm4gTUxYNV9WRFBBX0RBVEFWUV9E
RVNDX0dST1VQOw0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgc3RhdGljIHU2NCBtbHhfdG9fdnJpdGlv
X2ZlYXR1cmVzKHUxNiBkZXZfZmVhdHVyZXMpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqAg
dTY0IHJlc3VsdCA9IDA7DQo+ID4gQEAgLTMxMzksNyArMzE1NSw3IEBAIHN0YXRpYyBpbnQgbWx4
NV9zZXRfZ3JvdXBfYXNpZChzdHJ1Y3QgdmRwYV9kZXZpY2UNCj4gPiAqdmRldiwgdTMyIGdyb3Vw
LA0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRl
diA9IHRvX212ZGV2KHZkZXYpOw0KPiA+IA0KPiA+IC3CoMKgwqDCoMKgwqAgaWYgKGdyb3VwID49
IE1MWDVfVkRQQV9OVU1WUV9HUk9VUFMpDQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoZ3JvdXAgPj0g
TUxYNV9WRFBBX05VTVZRX0dST1VQUyB8fCBhc2lkID49IE1MWDVfVkRQQV9OVU1fQVMpDQo+IA0K
PiBOaXQ6IHRoZSBjaGVjayBmb3IgYXNpZCA+PSBNTFg1X1ZEUEFfTlVNX0FTIGlzIHJlZHVuZGFu
dCwgYXMgaXQgd2lsbA0KPiBiZSBhbHJlYWR5IGNoZWNrZWQgYnkgVkhPU1RfVkRQQV9TRVRfR1JP
VVBfQVNJRCBoYW5kbGVyIGluDQo+IGRyaXZlcnMvdmhvc3QvdmRwYS5jOnZob3N0X3ZkcGFfdnJp
bmdfaW9jdGwuIE5vdCBhIGJpZyBkZWFsLg0KQWNrLg0KDQo+IA0KPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDC
oCBtdmRldi0+Z3JvdXAyYXNpZFtncm91cF0gPSBhc2lkOw0KPiA+IEBAIC0zMTYwLDYgKzMxNzYs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyBtbHg1X3ZkcGFfb3BzID0g
ew0KPiA+IMKgwqDCoMKgwqDCoMKgIC5nZXRfdnFfaXJxID0gbWx4NV9nZXRfdnFfaXJxLA0KPiA+
IMKgwqDCoMKgwqDCoMKgIC5nZXRfdnFfYWxpZ24gPSBtbHg1X3ZkcGFfZ2V0X3ZxX2FsaWduLA0K
PiA+IMKgwqDCoMKgwqDCoMKgIC5nZXRfdnFfZ3JvdXAgPSBtbHg1X3ZkcGFfZ2V0X3ZxX2dyb3Vw
LA0KPiA+ICvCoMKgwqDCoMKgwqAgLmdldF92cV9kZXNjX2dyb3VwID0gbWx4NV92ZHBhX2dldF92
cV9kZXNjX2dyb3VwLCAvKiBPcCBkaXNhYmxlZCBpZg0KPiA+IG5vdCBzdXBwb3J0ZWQuICovDQo+
ID4gwqDCoMKgwqDCoMKgwqAgLmdldF9kZXZpY2VfZmVhdHVyZXMgPSBtbHg1X3ZkcGFfZ2V0X2Rl
dmljZV9mZWF0dXJlcywNCj4gPiDCoMKgwqDCoMKgwqDCoCAuc2V0X2RyaXZlcl9mZWF0dXJlcyA9
IG1seDVfdmRwYV9zZXRfZHJpdmVyX2ZlYXR1cmVzLA0KPiA+IMKgwqDCoMKgwqDCoMKgIC5nZXRf
ZHJpdmVyX2ZlYXR1cmVzID0gbWx4NV92ZHBhX2dldF9kcml2ZXJfZmVhdHVyZXMsDQo+ID4gQEAg
LTMyNTgsNiArMzI3NSw3IEBAIHN0cnVjdCBtbHg1X3ZkcGFfbWdtdGRldiB7DQo+ID4gwqDCoMKg
wqDCoMKgwqAgc3RydWN0IHZkcGFfbWdtdF9kZXYgbWd0ZGV2Ow0KPiA+IMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBtbHg1X2FkZXYgKm1hZGV2Ow0KPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbHg1
X3ZkcGFfbmV0ICpuZGV2Ow0KPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IHZkcGFfY29uZmlnX29w
cyB2ZHBhX29wczsNCj4gPiDCoH07DQo+ID4gDQo+ID4gwqBzdGF0aWMgaW50IGNvbmZpZ19mdW5j
X210dShzdHJ1Y3QgbWx4NV9jb3JlX2RldiAqbWRldiwgdTE2IG10dSkNCj4gPiBAQCAtMzM3MSw3
ICszMzg5LDcgQEAgc3RhdGljIGludCBtbHg1X3ZkcGFfZGV2X2FkZChzdHJ1Y3QgdmRwYV9tZ210
X2Rldg0KPiA+ICp2X21kZXYsIGNvbnN0IGNoYXIgKm5hbWUsDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG1heF92cXMgPSAyOw0KPiA+IMKgwqDCoMKgwqDCoMKgIH0NCj4gPiAN
Cj4gPiAtwqDCoMKgwqDCoMKgIG5kZXYgPSB2ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgbWx4NV92
ZHBhX25ldCwgbXZkZXYudmRldiwgbWRldi0NCj4gPiA+ZGV2aWNlLCAmbWx4NV92ZHBhX29wcywN
Cj4gPiArwqDCoMKgwqDCoMKgIG5kZXYgPSB2ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgbWx4NV92
ZHBhX25ldCwgbXZkZXYudmRldiwgbWRldi0NCj4gPiA+ZGV2aWNlLCAmbWd0ZGV2LT52ZHBhX29w
cywNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIE1MWDVfVkRQQV9OVU1WUV9HUk9VUFMsIE1MWDVfVkRQQV9OVU1fQVMs
DQo+ID4gbmFtZSwgZmFsc2UpOw0KPiA+IMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIobmRldikp
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKG5kZXYp
Ow0KPiA+IEBAIC0zNTQ2LDYgKzM1NjQsMTAgQEAgc3RhdGljIGludCBtbHg1dl9wcm9iZShzdHJ1
Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldiwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTUxYNV9DQVBfREVWX1ZEUEFfRU1VTEFUSU9OKG1kZXYsIG1heF9udW1fdmlydGlvX3F1
ZXVlcykgKw0KPiA+IDE7DQo+ID4gwqDCoMKgwqDCoMKgwqAgbWd0ZGV2LT5tZ3RkZXYuc3VwcG9y
dGVkX2ZlYXR1cmVzID0gZ2V0X3N1cHBvcnRlZF9mZWF0dXJlcyhtZGV2KTsNCj4gPiDCoMKgwqDC
oMKgwqDCoCBtZ3RkZXYtPm1hZGV2ID0gbWFkZXY7DQo+ID4gK8KgwqDCoMKgwqDCoCBtZ3RkZXYt
PnZkcGFfb3BzID0gbWx4NV92ZHBhX29wczsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAo
IU1MWDVfQ0FQX0RFVl9WRFBBX0VNVUxBVElPTihtZGV2LCBkZXNjX2dyb3VwX21rZXlfc3VwcG9y
dGVkKSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZ3RkZXYtPnZkcGFfb3Bz
LmdldF92cV9kZXNjX2dyb3VwID0gTlVMTDsNCj4gDQo+IEkgdGhpbmsgdGhpcyBpcyBiZXR0ZXIg
aGFuZGxlZCBieSBzcGxpdHRpbmcgbWx4NV92ZHBhX29wcyBpbiB0d286IE9uZQ0KPiB3aXRoIGdl
dF92cV9kZXNjX2dyb3VwIGFuZCBvdGhlciB3aXRob3V0IGl0LiBZb3UgY2FuIHNlZSBhbiBleGFt
cGxlIG9mDQo+IHRoaXMgaW4gdGhlIHNpbXVsYXRvciwgd2hlcmUgb25lIHZlcnNpb24gc3VwcG9y
dHMgLmRtYV9tYXAgaW5jcmVtZW50YWwNCj4gdXBkYXRpbmcgd2l0aCAuZG1hX21hcCBhbmQgdGhl
IG90aGVyIHN1cHBvcnRzIC5zZXRfbWFwLiBPdGhlcndpc2UsDQo+IHRoaXMgY2FuIGdldCBtZXNz
eSBpZiBtb3JlIG1lbWJlcnMgb3B0LW91dCBvciBvcHQtaW4uDQo+IA0KSSBpbXBsZW1lbnRlZCBp
dCB0aGlzIHdheSBiZWNhdXNlwqB0aGUgdXBjb21pbmcgcmVzdW1hYmxlIHZxIHN1cHBvcnQgd2ls
bCBhbHNvDQpuZWVkIHRvIHNlbGVjdGl2ZWx5IGltcGxlbWVudCAucmVzdW1lIGlmIHRoZSBodyBj
YXBhYmlsaXR5IGlzIHRoZXJlLiBUaGF0IHdvdWxkDQpyZXN1bHQgaW4gbmVlZGluZyA0IGRpZmZl
cmVudCBvcHMgZm9yIGFsbCBjb21iaW5hdGlvbnMuIFRoZSBvdGhlciBvcHRpb24gd291bGQNCmJl
IHRvIGZvcmNlIHRoZXNlIHR3byBvcHMgdG9nZXRoZXIgKC5nZXRfdnFfZGVzY19ncm91cCBhbmQg
LnJlc3VtZSkuIEJ1dCBJIHdvdWxkDQpwcmVmZXIgdG8gbm90IGRvIHRoYXQuDQoNCj4gQnV0IEkn
bSBvayB3aXRoIHRoaXMgdG9vLCBzbyB3aGF0ZXZlciB2ZXJzaW9uIHlvdSBjaG9vc2U6DQo+IA0K
PiBBY2tlZC1ieTogRXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+DQo+IA0KPiA+
IA0KPiA+IMKgwqDCoMKgwqDCoMKgIGVyciA9IHZkcGFfbWdtdGRldl9yZWdpc3RlcigmbWd0ZGV2
LT5tZ3RkZXYpOw0KPiA+IMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpDQo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbWx4NS9tbHg1X2lmY192ZHBhLmgNCj4gPiBiL2luY2x1ZGUvbGludXgv
bWx4NS9tbHg1X2lmY192ZHBhLmgNCj4gPiBpbmRleCA5YmVjZGMzZmE1MDMuLmI4NmQ1MWE4NTVm
NiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21seDUvbWx4NV9pZmNfdmRwYS5oDQo+
ID4gKysrIGIvaW5jbHVkZS9saW51eC9tbHg1L21seDVfaWZjX3ZkcGEuaA0KPiA+IEBAIC03NCw3
ICs3NCwxMSBAQCBzdHJ1Y3QgbWx4NV9pZmNfdmlydGlvX3FfYml0cyB7DQo+ID4gwqDCoMKgwqDC
oMKgwqAgdTjCoMKgwqAgcmVzZXJ2ZWRfYXRfMzIwWzB4OF07DQo+ID4gwqDCoMKgwqDCoMKgwqAg
dTjCoMKgwqAgcGRbMHgxOF07DQo+ID4gDQo+ID4gLcKgwqDCoMKgwqDCoCB1OMKgwqDCoCByZXNl
cnZlZF9hdF8zNDBbMHhjMF07DQo+ID4gK8KgwqDCoMKgwqDCoCB1OMKgwqDCoCByZXNlcnZlZF9h
dF8zNDBbMHgyMF07DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgdTjCoMKgwqAgZGVzY19ncm91
cF9ta2V5WzB4MjBdOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIHU4wqDCoMKgIHJlc2VydmVk
X2F0XzM4MFsweDgwXTsNCj4gPiDCoH07DQo+ID4gDQo+ID4gwqBzdHJ1Y3QgbWx4NV9pZmNfdmly
dGlvX25ldF9xX29iamVjdF9iaXRzIHsNCj4gPiBAQCAtMTQxLDYgKzE0NSw3IEBAIGVudW0gew0K
PiA+IMKgwqDCoMKgwqDCoMKgIE1MWDVfVklSVFFfTU9ESUZZX01BU0tfU1RBVEXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICh1NjQpMSA8PCAwLA0KPiA+IMKgwqDCoMKg
wqDCoMKgIE1MWDVfVklSVFFfTU9ESUZZX01BU0tfRElSVFlfQklUTUFQX1BBUkFNU8KgwqDCoMKg
wqAgPSAodTY0KTEgPDwgMywNCj4gPiDCoMKgwqDCoMKgwqDCoCBNTFg1X1ZJUlRRX01PRElGWV9N
QVNLX0RJUlRZX0JJVE1BUF9EVU1QX0VOQUJMRSA9ICh1NjQpMSA8PCA0LA0KPiA+ICvCoMKgwqDC
oMKgwqAgTUxYNV9WSVJUUV9NT0RJRllfTUFTS19ERVNDX0dST1VQX01LRVnCoMKgwqDCoMKgwqDC
oMKgwqAgPSAodTY0KTEgPDwgMTQsDQo+ID4gwqB9Ow0KPiA+IA0KPiA+IMKgZW51bSB7DQo+ID4g
LS0NCj4gPiAyLjQxLjANCj4gPiANCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
