Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A694599436
	for <lists.virtualization@lfdr.de>; Fri, 19 Aug 2022 06:47:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 243B1611CA;
	Fri, 19 Aug 2022 04:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243B1611CA
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=2O5/G3Jo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWBCdvlsHh5e; Fri, 19 Aug 2022 04:47:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BCA6D611B2;
	Fri, 19 Aug 2022 04:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA6D611B2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7379C0078;
	Fri, 19 Aug 2022 04:47:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8082C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Aug 2022 04:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F12441B95
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Aug 2022 04:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F12441B95
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=2O5/G3Jo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIG9JUuP7hX5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Aug 2022 04:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDC3419DB
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazlp170130009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFDC3419DB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Aug 2022 04:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYWUbY9u/28IHtv6IefbuBq5oW4j1Kwltocc9OCsI02ii7GKEI/8aeXajsJkxdqJ+jKxK998WygaSQQc94plTsUvmh0hQSq1IhQut8F4svqkGQrdiLHq/4Eqe9wMZUwyh353z5hP2NWERvLwHhSOK98eq3pmnrdedU1nRDJIXD6Xm7j353zy0oW/EbvIhuRTF3ovZxMJzQyxB7+4kpxC7eE8SXr/i91yMlQdGCKPnysSwVVKnGBzEpa48MDdGzSbhBJK2JOnNCaipZOBlolucZ7sO+w9cEP+/k2RjlILrPh9ZwP7asOYd3TXqFXfImoDird6lnyuJ6ksJLlY8o+hlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GadIG9wBp/IP7PcKaghuDRhFOXbNooE9vYSYblDoCh8=;
 b=MhBf2ABLv+oIA9TxTvD/BYXczlbfTwBAHyaFzp/Qtm2S3sLvs6BbdI5Nanq/7ryNSRHXYp/5QQotnvWlAjfPvp9fsJKkU3OGbEkJ3ohUxWlg6saRP+n4J0sOARRYPTK1KLvEaGQ58/31aFWgNhZS1l8XZCSSuHWTO7iRYxn8akwr+d/IR7mbDGxaflveYFuZdOCMa++S6YTFwoYeWd2zvja/JqbZsjeGLHp3Ex74AA7ffArZmDadFhxmGXSTTKHFPe11y7hAJPf5wVN3JXeLxL83x6EW+iAth85GF56NOTB3PP4oM4bs9EYFWZEL8sjaR2NAwzLemRdeOJXSvVohBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GadIG9wBp/IP7PcKaghuDRhFOXbNooE9vYSYblDoCh8=;
 b=2O5/G3JoaIw8/SVXVbb+QSjgzG9YUFhoad4MhSunU9A4LNCPuUE1LPdF2Rk6n6W+p2fDGClMXC+/0L7DGTNNYUEMCDzdhUC9zwVXEwy8o5JjrQQi+rw62N7tt/vOZCZbo1ZXx8x2Gr2Nk/ikG1LPqPh/ed8jSGUzGrv9WWcSvnQ=
Received: from BYAPR05MB3960.namprd05.prod.outlook.com (2603:10b6:a02:88::12)
 by BN7PR05MB4033.namprd05.prod.outlook.com (2603:10b6:406:90::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.14; Fri, 19 Aug
 2022 04:46:56 +0000
Received: from BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::30dd:741a:330:383c]) by BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::30dd:741a:330:383c%3]) with mapi id 15.20.5566.004; Fri, 19 Aug 2022
 04:46:56 +0000
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH v3 8/9] vmci/vsock: check SO_RCVLOWAT before wake up
 reader
Thread-Topic: [RFC PATCH v3 8/9] vmci/vsock: check SO_RCVLOWAT before wake up
 reader
Thread-Index: AQHYp0I0xNlWudOmuE6J6dMlL21JJa2k3gSAgBDg4YA=
Date: Fri, 19 Aug 2022 04:46:56 +0000
Message-ID: <873EFED7-1FB1-4545-899A-F57378C56FD3@vmware.com>
References: <2ac35e2c-26a8-6f6d-2236-c4692600db9e@sberdevices.ru>
 <5b7e133e-f8e1-1f71-9a3c-ac0265cffb63@sberdevices.ru>
 <20220808110153.fkxwwqbbqxz7wvgw@sgarzare-redhat>
In-Reply-To: <20220808110153.fkxwwqbbqxz7wvgw@sgarzare-redhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d49669d4-f593-4cb7-bf3a-08da819dd860
x-ms-traffictypediagnostic: BN7PR05MB4033:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zFUx32WFxmuEKI+PzWXmqKpKTuitzbZd5aAdmcn/vB88+lo8Yy9Zk+hrvxu1XHxVVAKVBTyDDgmVmFotl+ovZ4Q8m8OR7aIVISrUTgxvbI4mW/Tq98e6GNaFeLOOm8GqCsR7/AIbMdnd1EaBrJClZALL7mBBdQIvlNC7+ix9WSlnSQkZeVIYYkly0NNaMco9MxOFjxgHxYEsAm6/BOwwUZvtk+A0VsmoXPoyUkgCrGfPxMTZLs9AamrKbkXqPTdYtmtbfRbM5ifXJm5vgXueCkHt/fs3VpKKUYIUHUULQCycIP3XlXDNUzNy1J3TmlanuoPFJWsndYS2Gs0LXmPhnOj7+E8o5046lF3K3mWRqKdwT+kP0E3a5ktGQdkYmKWbMVi6T5IoFvltQAI49CJ3DVuh+W7iRD+W137sXyEfsRuDV9HcOtWYyvYbSjNJ9ovJdzpzEkx84ha+UcdRr3Pbef0If008wI4KH1Wi/E2TFyke2GMX55YWJF14s8WWEzpzs9OnrpNmbeP3YE1nCIdHFbqTFK18L5eSlKFNMH2/NODuTlz1pcZ3dn3ObY83D/96RqIac54eNeEuEfWEOQTYn+/AMEHBLn2fyg2ehzKRrAhP32ZMW590sYBza3n5Rvb+IzFr4J5Ao6BcPQ2xfk2WYOnXOz8mlydxdcZA4qn2vzwr2MBsbFLzdTTuPXWXgAq1wG0ztvTGsdR4hbNKw2795/H6Sox63mpkKBQFRjhaI+olto/strdd9FQxo60I/y40mJWVJD3c2CJn8PQdVbs4V+NwOQj77V0xXEEXnUFHRulwWvsiCe80phjhX3KTScTmgRiujcaPcWFlWet3XcrqzJGpR/yu9py7qRAIgzZs2/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB3960.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(2616005)(36756003)(54906003)(316002)(38100700002)(6916009)(122000001)(186003)(53546011)(66556008)(6486002)(8936002)(66476007)(8676002)(7416002)(66446008)(2906002)(76116006)(64756008)(6512007)(86362001)(6506007)(71200400001)(38070700005)(66946007)(41300700001)(4326008)(5660300002)(33656002)(478600001)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ToYOCbwlyC7kHPRIX0FIbh+Kob9bvX2ze91P/j6YI3yMEsxu7TjkTP8P678h?=
 =?us-ascii?Q?SRy1YK/j3bwMB03+WDs/AaTIKPN2FvYYm8wA4Gu4sB4WXzWMLSlvb2Cv+HDL?=
 =?us-ascii?Q?/7lHQu6BDXBUhPmW0NRJKUM/DgREonRQKVg7csIZ1w+e/R1BkwwMt9EOZLBi?=
 =?us-ascii?Q?7O7V6MCGIp1DKLVlZGiXw4ZPDmqUF1pfNVQuamEEmEoCdJIpN/0Q9G4hV9BJ?=
 =?us-ascii?Q?1igC9h97bJlJEYuTPTuWFbcZZlueQ5MnUqvuMRi6DbQ6PMD92AFyj5+zJ4c9?=
 =?us-ascii?Q?lxT090YYAHb/QdX0WNcsrSTQ3CZMAIVXbRFET5NoaWuLpA9iAOyRWtbEViR3?=
 =?us-ascii?Q?7RSfsaNDOzyIZAyBgOv4RRs7dK7cxT12psB/xSMw9jbs3b+JLsLZMFDpSn11?=
 =?us-ascii?Q?23fIz519U7FajShOlE31YhszK3W5XjiWt9sv8Z04exAgsV1CDgDBni5HF9eV?=
 =?us-ascii?Q?flVCIYpaMsY+7b3c5LiQtntsthKwjo8XmUxH8MLKLVrxbGEsm4B1TkW3kvIt?=
 =?us-ascii?Q?5V7mdrcl7TsJyxT21rgRhN0gxKWvFxK37RBGZ5gQMKirG2b1ZtwhjtAehdOp?=
 =?us-ascii?Q?dWQN09XOtH5fgWMYnyK2ZVTfwRu3Y4jfjVCT2gXXbkZWjrQ5SlK2qlgTEGMK?=
 =?us-ascii?Q?fSc/elU5Zb1z4CwKUkjr6BjtF2fGsQuYDDYh/eCztWW3jU4dh1RP2N1Uxu1l?=
 =?us-ascii?Q?vf2QouFlW5A5JHA9hZqQBT2RgGoPruSpHMu7ZTIR78KnS7Th89SFTCBqjEJP?=
 =?us-ascii?Q?FL9wG4iyAfEqUnMGCUYQxSh5Ym7kOSWNx5GCl53u0ddIPRsoH1pV/jDDemHl?=
 =?us-ascii?Q?vU87P01BjckXpH3r95+EOUUghGP4w9Il7vjRg0BLHt4F4ojokN5kIw1wZVN3?=
 =?us-ascii?Q?AjBks1a+Mvjh9z8zd4PdYrd21R/soi46bDUfOrYy3znWuZrOH63PsCoRHH8w?=
 =?us-ascii?Q?ho/BKyv4czLYRYCXynSJP4n7RiW0eUM1UQk0rPpwnnOohZxw5nwLQBY5Zsnv?=
 =?us-ascii?Q?NAizf9y03AJhJv72nfBMTpb5cnPLp7goZjK1T3gRVn0AP9I5qsyUTSkiADLm?=
 =?us-ascii?Q?ZXlbyj6SMaZvXMedkr6In08vctsLrxehbLgC2g80HZDNCBORYfZyYr63tLlh?=
 =?us-ascii?Q?M5ZhN684E+I/lSSyLQVxRdVJK/RzFD7bVbmCR2dCT5/hKXJBQoqG+/FkmbvX?=
 =?us-ascii?Q?Oo15SU/xoG1sHBoAZXvTQrnW19ycYx4kbPxBOFShTaZAskSVT2FF2d0Zdb+Z?=
 =?us-ascii?Q?CJYpASzLkb5lH6cvTvkYANjO8EznNnXyddtCwo/iYDZ+LLGN18yyUPybm87+?=
 =?us-ascii?Q?OvcFQRCm+xpNiH6oYgmDVghMrPzujAoFG2Hlc0feT/Wloa7Dt25DSQfgZBX1?=
 =?us-ascii?Q?nVc69HA9i99rX7W4iWlQ/43uyIXuILdB6tGzq5DRlfUWCkC0+7obs2yW2muR?=
 =?us-ascii?Q?BbY2yugNPvomwTVkWvNCY51az7UirbBybkCv6ppPutKepejd4DEQycBgXPeg?=
 =?us-ascii?Q?BJgpz+gOf9g8GTFht0hMpEzgAyZ0vGws8rUE2y67K7RrPB+ufYxXk7d0Kpux?=
 =?us-ascii?Q?1zMxuYDUgswoJI4RdP6LAVjwoCutxaHFN+Ek9pL5Rr/bKHIFsNwTkz5kt0us?=
 =?us-ascii?Q?FO8D0LdxBmky/wtW4O6Z69In0eRibtgkn+OrIYG3avu3?=
Content-ID: <0D5F5D2183EB8642BFF7CCD8A616B386@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB3960.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49669d4-f593-4cb7-bf3a-08da819dd860
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 04:46:56.6101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5UzMzmaQn5jYgbELqSV8pv0yjlAuC0fJvqoxX3u4blI1NXBFIBKjPz0A3Bm9OD3RKzdPgnXoFHIaQJEEqjhYTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB4033
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "sthemmin@microsoft.com" <sthemmin@microsoft.com>,
 Krasnov Arseniy <oxffffaa@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Pv-drivers <Pv-drivers@vmware.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Bryan Tan <bryantan@vmware.com>,
 "edumazet@google.com" <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, kernel <kernel@sberdevices.ru>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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
From: Vishnu Dasa via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Vishnu Dasa <vdasa@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



> On Aug 8, 2022, at 4:01 AM, Stefano Garzarella <sgarzare@redhat.com> wrote:
> 
> On Wed, Aug 03, 2022 at 02:05:52PM +0000, Arseniy Krasnov wrote:
>> This adds extra condition to wake up data reader: do it only when number
>> of readable bytes >= SO_RCVLOWAT. Otherwise, there is no sense to kick
>> user,because it will wait until SO_RCVLOWAT bytes will be dequeued.

Nit: add space after comma.

> Ditto as previous patch.
> 
> @Bryan, @Vishnu, plaese, can you review/ack also this patch?

This patch looks good to me.

Thank you, Arseniy for running the new test with VMCI.  I also ran some
of our internal tests successfully with this patch series.

> Thanks,
> Stefano
> 
>> 
>> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Reviewed-by: Vishnu Dasa <vdasa@vmware.com>

>> ---
>> net/vmw_vsock/vmci_transport_notify.c        | 2 +-
>> net/vmw_vsock/vmci_transport_notify_qstate.c | 4 ++--
>> 2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/net/vmw_vsock/vmci_transport_notify.c b/net/vmw_vsock/vmci_transport_notify.c
>> index 852097e2b9e6..7c3a7db134b2 100644
>> --- a/net/vmw_vsock/vmci_transport_notify.c
>> +++ b/net/vmw_vsock/vmci_transport_notify.c
>> @@ -307,7 +307,7 @@ vmci_transport_handle_wrote(struct sock *sk,
>>      struct vsock_sock *vsk = vsock_sk(sk);
>>      PKT_FIELD(vsk, sent_waiting_read) = false;
>> #endif
>> -      sk->sk_data_ready(sk);
>> +      vsock_data_ready(sk);
>> }
>> 
>> static void vmci_transport_notify_pkt_socket_init(struct sock *sk)
>> diff --git a/net/vmw_vsock/vmci_transport_notify_qstate.c b/net/vmw_vsock/vmci_transport_notify_qstate.c
>> index 12f0cb8fe998..e96a88d850a8 100644
>> --- a/net/vmw_vsock/vmci_transport_notify_qstate.c
>> +++ b/net/vmw_vsock/vmci_transport_notify_qstate.c
>> @@ -84,7 +84,7 @@ vmci_transport_handle_wrote(struct sock *sk,
>>                          bool bottom_half,
>>                          struct sockaddr_vm *dst, struct sockaddr_vm *src)
>> {
>> -      sk->sk_data_ready(sk);
>> +      vsock_data_ready(sk);
>> }
>> 
>> static void vsock_block_update_write_window(struct sock *sk)
>> @@ -282,7 +282,7 @@ vmci_transport_notify_pkt_recv_post_dequeue(
>>              /* See the comment in
>>               * vmci_transport_notify_pkt_send_post_enqueue().
>>               */
>> -              sk->sk_data_ready(sk);
>> +              vsock_data_ready(sk);
>>      }
>> 
>>      return err;
>> --
>> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
