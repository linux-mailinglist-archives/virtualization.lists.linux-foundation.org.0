Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A73267C6C90
	for <lists.virtualization@lfdr.de>; Thu, 12 Oct 2023 13:40:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A72140A48;
	Thu, 12 Oct 2023 11:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A72140A48
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XSMdvhJ2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzBlGQANt4G2; Thu, 12 Oct 2023 11:40:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 287FE405FA;
	Thu, 12 Oct 2023 11:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 287FE405FA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53B75C0DD3;
	Thu, 12 Oct 2023 11:40:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD097C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903534013F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 903534013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyBKeJS_aohR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:40:38 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::618])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E238400E7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E238400E7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4ab/XIklRu7TZLNK11yHm8VA4GJsg/LiV4OfDVbL6RpWUNSIo++9CPGsFbDMAGwvv+izvXMp8+6fCXunxZJOpXuZlPRIlYGia3MVeoFVPwa0ye5GiHyWohvFdTM0Zbg/jIyni5IvLZV1NuTmnjOuhzjg5J1KyUE4NBO5VFtS+DaPLLkjfaXeHOp+CTX76axaZV4qlIG1cV6vBjS03uKrLzWW6d9qoNJuQ3y9QgWKfKrs52a7zPLYw1shAKmWUxayQrooFyGYPzguJJRxJ6WgLwifNYa2pKQLJN31aKwlEfWYofXVYCIYR+YbQ11gFkcBGwkaF2UliFPvfmxwJ/vqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNRAYLXUL2+mEkXE/6EV+zstySniPZVouylR6g+Mlao=;
 b=HZNGqmXbnsJkSodLeoXSHQGRoqfvKJg7t5iDRRU2KIakmYJbL4XXoBvXyAKoMtXwaN/WiaTaxVjVP6SGvZEgnXjmEUqzTvTuSxsDt0zLWtryxvYP8IW+1Hu4+HIgswIq8QSiT6F2T7p0u01CNfVsT/f0B/zjgajOAqpVsIfy6L7nqniolOj9mM5RLj/rgsHDE7bGAX7itNHuK4RZfiocy0VA3Dm+zrBWK6+vzvTJmFVPFhOALpRPuQJRGUPCxfrHhtzDWtAJmK0FhgT3T/1eG3OJJCosocZjn29PK6dvJdjacHlGopoca+NNSSSP9aArDB/wl7Ky9wgmBmip86tkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNRAYLXUL2+mEkXE/6EV+zstySniPZVouylR6g+Mlao=;
 b=XSMdvhJ2tB3/7aQsdqSMlBm3Eopxc+o3DoBd+5BVYq4N4LoGyGjFmneVBfxSQuXDyI/NsYui+EWwpZe7ckJRxbe4Rpb5uxM/jZr5WV9tsXzi1zhnuJDMmvuEe7pQ8wABsajsF9WtT4Q8O2DGH/H2U6I99oz1sLx8TcvO5+No5Cf/at/c3PQbERJbEGVMBOswYvh0CaY7CaTtcr+FRiA+slMvIbYYhGFzyXt1SjZmLPmYKzm/jWGW/kD6/Sj6p+sSTJsVOvJ4Rj+uuPyegzoJPIEXhSrLA213xEwG3b/ml4JFPhTj9ar/qr+aBaaJt/y22npcN2H3FB8TDrdD9Sfp/A==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 11:40:35 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::23d0:62e3:4a4a:78b5]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::23d0:62e3:4a4a:78b5%6]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 11:40:34 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH vfio 11/11] vfio/virtio: Introduce a vfio driver over
 virtio devices
Thread-Topic: [PATCH vfio 11/11] vfio/virtio: Introduce a vfio driver over
 virtio devices
Thread-Index: AQHZ7IkPl5ENqOgMC0yEzkOHANq/CLAlfIYAgAACZQCAAAJ1AIAAAaqAgAAD/QCAAAaKAIAAAwkAgAAF2ICAABWjgIAABYGAgAAGVYCAAHFrgIAAnJQAgAAAJ7CABBFQgIAAYeqAgACr64CAAJhp4IAZncEAgAABy1CAAAi4gIAAAoNA
Date: Thu, 12 Oct 2023 11:40:34 +0000
Message-ID: <PH0PR12MB5481589848BA2DDD0DD2DE3CDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230921155834-mutt-send-email-mst@kernel.org>
 <CACGkMEvD+cTyRtax7_7TBNECQcGPcsziK+jCBgZcLJuETbyjYw@mail.gmail.com>
 <20230922122246.GN13733@nvidia.com>
 <PH0PR12MB548127753F25C45B7EFF203DDCFFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuX5HJVBOw9E+skr=K=QzH3oyHK8gk-r0hAvi6Wm7OA7Q@mail.gmail.com>
 <PH0PR12MB5481ED78F7467EEB0740847EDCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230925141713-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AF4B2F61E96794D7ABC7DCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231012065008-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548135D0DF3C8B0CD5F73616DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231012071804-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231012071804-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV8PR12MB9111:EE_
x-ms-office365-filtering-correlation-id: 09bfc200-67d9-4a76-2281-08dbcb180c08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZS8jcjB11tKFDykGaEsUs0TFtN+/3KVA9BqM87nyg14pSPkZO0MKbmaFr1UG13UKlHoG8SyB8Iaqk25qSvd2IUMbWOPocahHZVlHQnHTkh/D+kV0qNtW4ja0nUlMrw53hL007onevUbrkUlDsZQI+vkeJwBszlzQ91NCAdSO+we7YaDKSf2dONNPzAr3Lu6syBgq3ElxZdSvxmr1uf2Aibt54ZgdlQWyU+3NRcF4bOJjfcStMK2eh80C2ncaH1/KnVaflhN1TGYKnoiy4JviUZNIktmmtsNruK+Hg5ntH5G7hbKZVdG0NH8Xs+wdPMk/aI4m9gm8Mj5xEOPZyrpmoiGfuYWY2Q80G4lqNsodAMqvHY3TPlK8+KDq/PcGFDjl84SNaXpn20g6RW+n/uFE8XIVdp/wi3iagZ3fQZyIQptDpgIogc9k74Zn3sB5vJ/cy3ZqR0c/xKimnUfRAuDRtjHWnhh5ydYH9fqSfrWJUWgTynWm4Eh9x7WprWC7gY3LDgLUkd4tK3wvIXTHKewNDmtxqcmwTzehI3RD5pDGM7UOYu447QlWeeIp2hwzuK/maKsriX1RpEU3l1woMt3ZqxuaU/53WQ0tvkJuyDyo9yOBwNfLEAaOJTI6JaaEHb3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(71200400001)(7696005)(6506007)(9686003)(76116006)(66476007)(316002)(6916009)(66946007)(54906003)(64756008)(66556008)(66446008)(107886003)(26005)(55016003)(8676002)(8936002)(4326008)(52536014)(4744005)(38070700005)(2906002)(122000001)(5660300002)(41300700001)(86362001)(33656002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K2hSBI3pst6qcaeB6qRi6rG0Q8rFYww4k2ijnQESoS57qkB091QQbWSt19qF?=
 =?us-ascii?Q?RFExCO6k3LjBAwhhOmynViMzeC2jefH/YrMZEMfAlQytsLuerImfYh7JhpPZ?=
 =?us-ascii?Q?mXT2+Hx9Xf/PtK85CePHJ+iM2w3jnc2M8oa/yLMI7h2DLcvxevJx4T5Y6+1I?=
 =?us-ascii?Q?7EsH0tbxETx9w1oWE1Z2Zu6ynlsb2Tpst73MhpP89gSZHIjQ+IW4oBEVemA3?=
 =?us-ascii?Q?anVOmyAvQIpf7uXn6iBiHiUcNKGG2eN91890xdBEFFgOLp3CDzIudgIQNVMw?=
 =?us-ascii?Q?/RFghz1gJPq8BNkFzCW6kMsUFMAQJdFmeWpGf+ogPnSj0MZ1/YCGucUG6TAg?=
 =?us-ascii?Q?T+d7f7dFrhnmF+LWHwcUgwz2mLGlGhl7eqMRocwokRNvb2WxVDnmCcRV3q3X?=
 =?us-ascii?Q?jWNFYtB6cLvcnRLljxru9tHhPKQuBPBzUNUMAM7yn5p4slWSKXWzxFMX8vZW?=
 =?us-ascii?Q?8RxAuLpR1QuvVfN2bqtTF49nI/sDnkcPO3vzCrhHxmJTQE652Brk99fTQQXG?=
 =?us-ascii?Q?86yPP8iuvRW3Qwkgv3U25lGK0iSkXzsgsVRQNCGBRonql149sElsXx3s224r?=
 =?us-ascii?Q?NzXfwwUf74BRjeNjQJFYmyOKRIUz8SZNlD7Fves1HhR+knZKOfKmPjjdJNkf?=
 =?us-ascii?Q?ILHUZXUPR39DsJXA1VQjWDLTlgnOSuThFCPsrqDV4WJtEv110XsgPCD9cqrM?=
 =?us-ascii?Q?0POQPUD2NxHo36ObcmFQM8dKyq8+Un7qPhHNIZ9NxUTarR+CDe9AXDWpN7cN?=
 =?us-ascii?Q?k3wNjzqRxAywdRaO6MU3C0KRQgPs5IKh7SXF4kfGifJ5dz5nlOsw8Fh1zH+o?=
 =?us-ascii?Q?haw2fJuzrK+X/psycIPFzzhivdBoEytCW5yuFGxTpfr3WGAuE+B1d76AEspK?=
 =?us-ascii?Q?KIliSfejacBBFTKX/AIuoyJo6CafWuyAIJZxHF6PgwWoqzy/d0Mz31Ii4+AD?=
 =?us-ascii?Q?erTsiTtwB2M7rzZxMCGZxIxlDr0vlPQSjlrc9S1ldPnhDlGPjimuFnSMfPxX?=
 =?us-ascii?Q?LADgQm7UWekDnrNMg0AFIjObmHYDShA6sJOI8EkAXBewckE0QDROj8hPNRU4?=
 =?us-ascii?Q?A7HX8ySEuRhAYk52G7Tt3foyWVnoH/gRKnleXWKwRCb6YsQUlh4OyQQseaQM?=
 =?us-ascii?Q?B8sAZTs6di0ixa1+VAh+xcW6xHVyyxwHFDGdB7oQ9UzaJWP9rwFverrhkwA6?=
 =?us-ascii?Q?teVcUnuL4eGiyu6BocTjtzfSWuUtKqa0X9mM4jK8oG5gWYRBiqYCJ5SnQQfS?=
 =?us-ascii?Q?wTLZu9ep5tcFY+OIEbgIyn9TUmoB6uexWgBcVOyvrtOyyM4WKryfh+Omp5FJ?=
 =?us-ascii?Q?y+S0IbRM6gZkXbNcB42dR0Zw32GttMf3NPjAJ0DuXfHboYB39jGnPLVUKyiv?=
 =?us-ascii?Q?UCK7ik+AM8uMTqbz7wuachU2vS/9LDlPhyWZppiH4kpEIlKk0V1AhomCWmvt?=
 =?us-ascii?Q?8hsGpwDzo7uQqwF6yVlpvL+9mgWsYpFXkudB/XXfbQkXwKpD8QIDki55ULls?=
 =?us-ascii?Q?IUE3GptfVOkY51fkTZ/67v1M720BJzCvSTDSr3QbJso0yXAIgHdx5sDyUwAF?=
 =?us-ascii?Q?LVxAwj7YBsmVZUbfGZ8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bfc200-67d9-4a76-2281-08dbcb180c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 11:40:34.4215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJ9MhgKeqYKx9v9QYnSpP8dTZBUeYgSiIx5t0B04VuZ794cLdJuC3n3NbPjlqF2+l1F+4NJ+55IvLFqD9Y5Maw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
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


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 12, 2023 5:00 PM

> I am instead talking about devices that work with existing legacy linux drivers
> with no traps.
> 
Yep, I understood.

> > I am not expecting OASIS to do anything extra for legacy registers.
> >
> > [1] The device MUST reset when 0 is written to device_status, and present a 0
> in device_status once that is done.
> > [2] After writing 0 to device_status, the driver MUST wait for a read
> > of device_status to return 0 before reinitializing the device.
> 
> We can add a note explaining that legacy drivers do not wait after doing reset,
> that is not a problem.
> If someone wants to make a device that works with existing legacy linux drivers,
> they can do that.
> Won't work with all drivers though, which is why oasis did not want to
> standardize this.

Ok. thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
