Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4D5B09CC
	for <lists.virtualization@lfdr.de>; Wed,  7 Sep 2022 18:12:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD1760E07;
	Wed,  7 Sep 2022 16:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD1760E07
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rT7E4DrB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JX1-lxyBMGen; Wed,  7 Sep 2022 16:12:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7516160DFF;
	Wed,  7 Sep 2022 16:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7516160DFF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 878FBC007C;
	Wed,  7 Sep 2022 16:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31FB7C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE916405A1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE916405A1
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=rT7E4DrB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECE2YT4DaHn8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:12:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C1E4054B
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4C1E4054B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liocXmwd8PjiMeZFiu+5ZZqnwsspbDcLYZ8E+u4mvyvlC2MO89WnTISsfW7pOMJ9qVraC6AIkjrTtjIjaN6ZLkQ7I7qOCwHkw6duXrwTO/a1GLJp5kI3MzC4DMr6AKsuFzBNLcz8nBGt/JmRWdG1e4UxtC/8qqPak3KlrYJFVOcCAfwWu2B9ef1FISQRbr7liviywwH+ga6Fa3nxDwZxzRTLCYflInL4s1DnWZdCb1Mg0JkY9XBfRWtw99QNaDBobeN77qKDePC8v6nWrh5rvdM/M4KX8ZH9GaqpamBnYYU0ez3jxMVZNHnaF2zSK1mPcRkOFxiRb8/72lkQ2rRliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdFpmOLPlQKDFi2KQuixc0xzowfrdtCkNv189wwCenQ=;
 b=QAl0PivRH0I3XvuEJDPj0cFUO2anNOwER7JP4uzMEIzDR5U7x3B+QHqMrhFZs5vNB6gi6O+/6RmyYoE7LBEld9EHcyXX82X3q7Pau6uj/IC8sj0NHk50arTUwu2ePDcH2Ud5CCMofe6LEWxrdV6RGHQqYQfpRpTZQMRnOOxWmz44JSwbR5XtpfS2tuKjbAZSAz0ovS0BTjLdpb0HG34oqsgNwK44tBOctOVtfl0PmYI/WNQ/PIS8U4K1kpOJOvEB6ud94B7sQoh8DZELZxz8uTL6tH5gbvyFry6msZzD77UaXWlENLQgsVj2eoG8WvWJAt9Yg+mEKHG5fOB2YJR3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdFpmOLPlQKDFi2KQuixc0xzowfrdtCkNv189wwCenQ=;
 b=rT7E4DrB+UW/Xp1bY3EoP6X+6+ySOXQC8PbvqqpEq8jaRqE80F7PiAT/RcFd69O4k+pfP4nH8sJXyrYt3xMQtH2It6c7wtwrEXNo9xRQq+xoEoBSxkRr2aSn+9uYgAf9UCPh9cd+v+c2Q5nIOQfuWWq7H746nyKkfg15IyT7ufeMB00FWj5rDVU16XVfhr+9WGz+A8s4vcUzbsOhX8RhRU/YcDt1VDrMunaUFJIeHrEm6BNumybeoNhrWi2AWUzwY6Ujubm87aU0/Ey1shp+S0EleV0pecbgd0VUz2SCPD4We/2/Zac0cKs3oApC2t4AHiWHJkWLNb7g+2lG8Cqh7w==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Wed, 7 Sep 2022 16:12:47 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::1429:e3e9:dc54:ba98]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::1429:e3e9:dc54:ba98%9]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 16:12:47 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v5 2/2] virtio-net: use mtu size as buffer length for big
 packets
Thread-Topic: [PATCH v5 2/2] virtio-net: use mtu size as buffer length for big
 packets
Thread-Index: AQHYwpEbqLdY6RByfkyoSMo8wpA6EK3TsrMAgABG8oCAAA3LAIAAADnAgAACroCAABYGQA==
Date: Wed, 7 Sep 2022 16:12:47 +0000
Message-ID: <PH0PR12MB5481066A18907753997A6F0CDC419@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20220901021038.84751-1-gavinl@nvidia.com>
 <20220901021038.84751-3-gavinl@nvidia.com>
 <20220907012608-mutt-send-email-mst@kernel.org>
 <0355d1e4-a3cf-5b16-8c7f-b39b1ec14ade@nvidia.com>
 <20220907052317-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812EC7F4711C1EA4CAA119DC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907101335-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D19E1E5DA11B2BD067CFDC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907103420-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220907103420-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5866:EE_
x-ms-office365-filtering-correlation-id: ca4e01e5-951d-422a-4896-08da90ebce0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sMALsQQxew5XC+klPa0so9UU9DfwymX11DTZBJZHiCfA3OtkqCcbb5Llw3Ni1q/X+QsUdTATnPivFWsq9F/1MUR9PO3kQpYhCiVyDFQCLKjVRCnpmYYeCQdE0zVbJUzAn2Mp7y5rwQm8KbVadm8TFtWJwOCXNzdR7FBssMFavuMpr7YYJ2WzapTzJVnZTuKColV8hvDhT/jeRcV355XJWa/V+4NVQoWypuJwd/vOeKYh1knzvKxdXJFXAyKNOqvABniWeHVy4q6Z0B5HnYtxV3lKFm2s5kOg4Ee1t1DZ9Ed5rnXIhQ8VUDdxO0moPtO0boJVzI3MjO5B+XoNnucu7/yMhs/jCdbUrOZ87BXwNGFZKTf9uCdv5Kq5XafjIH1o8NGLulT+9bkIHe9Hp9bfg22+pG+CsK2ncSit/gt1apcqP+oQ0BVEroo9ykN4UEP+hGLdjKKb9sPCntkGMcPhHSo9EfgxOl5GcGKhliR8B39iCC/V/3lHYLQWKLKWcNqX9kxHyhtrL9+ALLvaBKcutUVHVCYIwk4YCOgmP1mJS/RLrfeXqN8FYT/pjfwO51lEKoUDgVoXr8NmFNxeYUIqxK8mHo0+IU0b3YXK0mnKD17/ZRRLHOzAp7eplIpozCBA4GwYnAbU3Hir+TL/cFUh6PBcYytcc0+jMZ2k1SftoFb4M2Uykgfqz03+aFdHDeQGjkyYJ7SKcvSK0oFuxH+O1HuB1PB9sDiFKemvLwwSDD3T/sMmfYaVwPMY9SlHkm8Mq34KGBKLTntx+9L1v5uWJ14m1krpawwSEpQrBtefzBORO07joiMmbxB4ybHAEeTa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(26005)(9686003)(55016003)(71200400001)(316002)(86362001)(122000001)(2906002)(6916009)(7696005)(6506007)(54906003)(76116006)(41300700001)(5660300002)(478600001)(83380400001)(38070700005)(66946007)(8936002)(33656002)(7416002)(186003)(38100700002)(66476007)(64756008)(66556008)(8676002)(66446008)(52536014)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OAak2PfTnSwTrtdnla1Z8dePwmDUmd0CE/mvNEq/dJJuByfOusT6Pwzg43i7?=
 =?us-ascii?Q?uKuFCMGWnQ1OmyjdP7cecw0pXEzvV9Us+dohK7ccGGBx2rq1/xvtsnDHjDxk?=
 =?us-ascii?Q?KNApTEuLsp1PsWiPrDjF5/v+XaETtiQK4mqIt51Yv94cLR2hfV6X63S//d1d?=
 =?us-ascii?Q?LDo5y1CuQoQLoZGVubB3MAfbeHgJr9nubxkdlzIn1W9hJstGCfj/4n1ncFiu?=
 =?us-ascii?Q?spNpVo6w7Go8XZuvpRznemB69ylhIqG6olKrO6WGej0Z6kNsz3EC83ZM7xud?=
 =?us-ascii?Q?E82sNQ6MQpqAAf9lfkEeftV0sA4NoYMp/ugcZjePAto/n5E6nhezBz6kyj7i?=
 =?us-ascii?Q?AHjQiALI0sDVkJoDIXP2zqDBrgyXo0WbiPDmWL4NilfSKM/3J3a/paJ3iZIH?=
 =?us-ascii?Q?RaSc1vnQ2BNwHtVLQRViMaJzAc9JFH/JlEJLcJt6IKMvwouKZ5BOISsJrblo?=
 =?us-ascii?Q?IuY8k3CFML5hwGlrSqvf10nCOdiUaRY9JZp3JJGK4RN4/71srCR/qU0xGoTQ?=
 =?us-ascii?Q?PAG5vaRo84Wk6fH5BNUHBKNBChh/UZiCTFVeKpJ7DH1++YbKRP43Oquu/CXJ?=
 =?us-ascii?Q?eAUQGtnTankqralO4BIg/b2V4PGBrLB386m6ofYPATtuJ/ARBrGAymRUJRX9?=
 =?us-ascii?Q?VY2StBXVjgozmMTmHS25pKKQxfN67FHVdunoiIVNJXSChYAwmMKM6oEr3nIy?=
 =?us-ascii?Q?OH9ls4/NGSV04oOPlEbuqOcZYFjV71JWwd5GvIPLvByu2jo4wXAok+/OC53y?=
 =?us-ascii?Q?LLSyys4LI/vrYoYVH1549bMm+pO/TaZabNYy34zjVyZZ8gA3PF0FGgU1Ttlc?=
 =?us-ascii?Q?Q4Wbae3DrCAL6Vd33qlRjcAbJIzMHTrJUvQVHoa//wHB7PfY03chHRGw8cPw?=
 =?us-ascii?Q?/F9K8YkHRxtobdcMISfaBLhwjNCWK+OW8jrBYU7SsqWsgFzEgh1fwpPt7HUy?=
 =?us-ascii?Q?vA+d3PsLMtLqePBs98qIlnG01sg1xmPWXJYe9FcBzFMfe7y7OHKxw2xg9kY1?=
 =?us-ascii?Q?m3q4FjAg1wzCsPIBVyd/sZKHuzF7h/zAkjxXjCWU7Rs7D/NcyfFq+q7q/ohq?=
 =?us-ascii?Q?DBUIDlXTidQSdLtuwnKjQbXpmm/NEjIz4jq+4EV111AXJviUcmQ9YPdUzILE?=
 =?us-ascii?Q?89gR9ZlabCL9wbiJVa4xp7vyk203vBMDN//nN6ciYBdUFRfEedBH6gG1wjvP?=
 =?us-ascii?Q?Ht3CIRsZZiqo9KQLhTBgVYfFtx7Tr8L5uqPoVoQO1Eqh25f+hI/pTJ/9+ain?=
 =?us-ascii?Q?yu5hvdK3Ie+wqupkFFYvchJj3ADSIez4tajZq/DcbotH+Go5U762yImodTzR?=
 =?us-ascii?Q?9pfUmK1fOLz3le0IQhAFQ6W842ghjiPmqV7xANUfWptiSVsw2r9apFuVodTG?=
 =?us-ascii?Q?n7Xo42Sa0rZ2Oh2MzxpfFjxszdVIdf9CKX4k0KkYx1xzvIANpEy6uT/pxaPn?=
 =?us-ascii?Q?jKtsNrrO07uSQoLagCOenKGCT5TCfnhdV/HixRoYEchp6VOBgoMbbir/sMkX?=
 =?us-ascii?Q?CRgYSGkW3Li7UdBc5FGp4L2lzEDaD+ZInj4yfDqPkNXkp0Bb/HZ9ez6QTorI?=
 =?us-ascii?Q?isaeRtUqTvWcbMVAAMs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4e01e5-951d-422a-4896-08da90ebce0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 16:12:47.4790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ePvGptBLaqDyUCNmnU2FmqRnSDHveZnsrW73GSpicBiSV4EggRe9WuZ0e0JNZ9IDLc2Jd49AsEHvczplI1i+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "sridhar.samudrala@intel.com" <sridhar.samudrala@intel.com>,
 "jesse.brandeburg@intel.com" <jesse.brandeburg@intel.com>,
 Gavi Teitz <gavi@nvidia.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "loseweigh@gmail.com" <loseweigh@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>, Gavin Li <gavinl@nvidia.com>
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
> Sent: Wednesday, September 7, 2022 10:40 AM
> 
> On Wed, Sep 07, 2022 at 02:33:02PM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, September 7, 2022 10:30 AM
> >
> > [..]
> > > > > actually how does this waste space? Is this because your device
> > > > > does not have INDIRECT?
> > > > VQ is 256 entries deep.
> > > > Driver posted total of 256 descriptors.
> > > > Each descriptor points to a page of 4K.
> > > > These descriptors are chained as 4K * 16.
> > >
> > > So without indirect then? with indirect each descriptor can point to
> > > 16 entries.
> > >
> > With indirect, can it post 256 * 16 size buffers even though vq depth is 256
> entries?
> > I recall that total number of descriptors with direct/indirect descriptors is
> limited to vq depth.
> 
> 
> > Was there some recent clarification occurred in the spec to clarify this?
> 
> 
> This would make INDIRECT completely pointless.  So I don't think we ever
> had such a limitation.
> The only thing that comes to mind is this:
> 
> 	A driver MUST NOT create a descriptor chain longer than the Queue
> Size of
> 	the device.
> 
> but this limits individual chain length not the total length of all chains.
> 
Right.
I double checked in virtqueue_add_split() which doesn't count table entries towards desc count of VQ for indirect case.

With indirect descriptors without this patch the situation is even worse with memory usage.
Driver will allocate 64K * 256 = 16MB buffer per VQ, while needed (and used) buffer is only 2.3 Mbytes.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
