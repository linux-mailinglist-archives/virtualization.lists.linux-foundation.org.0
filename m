Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0870563F360
	for <lists.virtualization@lfdr.de>; Thu,  1 Dec 2022 16:14:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C936109E;
	Thu,  1 Dec 2022 15:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C936109E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=eRsSTXlc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POBYILdoZHMJ; Thu,  1 Dec 2022 15:14:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 474B66109B;
	Thu,  1 Dec 2022 15:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474B66109B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62311C0078;
	Thu,  1 Dec 2022 15:14:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6664FC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33628404EC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 15:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33628404EC
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=eRsSTXlc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMBay4ha0mJ1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 15:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AE07401C9
Received: from CY4PR02CU007-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AE07401C9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 15:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMTWEA+sPe01oHJMZOgGsOw70C7xCQ+JXiR+LTXbuMUbDnwPEx03q44OVlJNZa+vT68Y2SRg7cawBsiFp12e9VfdWnp0W9AmeZXBeE26jm5zhlKuW2BNgXMRe1QtM2PPk5ykECqalNwNwHvAutQ+7Te+MtaFQQrSWPbOj7qpUjG2YGb2kXk2ZmOWpF1FghHQLpV4vzV56mFA6Gam2kETMZt+dzbaz6ujR6rZ5YBXbIZIBEQO2QzY3UdZ5tENMaLdvDvM1/0ah/Mqu7L3MlzzQH05xzir5Ni40hNgBqs/jkOR9B4LPgWopwXAt1Zu0NsQZKM5E7pECcQ0LTAAs3OeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDAdiY9IbgCSnH534XIbk5oSkMgpZq0W1pEerzWGMxk=;
 b=gbPwil54ceFaYz49H0Pt1fv9zrMcUO33cJy/w5p0rzdsSKYksKDZV8u3vw5CPMvb5qsYN1eoJR2tCNOjAvBdC22xIQDxt7ImamIqG56N5Vb1Odu1QkV3SThuSLIWIaMFjE+oPdWo15gTjgzHC5xCws9b7FjPH+7CaOam9Nz3UQVwr54paMTMR1FsKzbXRCintcEIgt23+oav9ns/Kgb0xtwDySd6YE3sFaMNMe9LbgafDoYKQ74VdTiZxCrlV5o6J+5EuhcWuElVKXZeZxLz7WqRDOGDbiSPK0GhmpEdpM7uKT5KTGKMi3olcjQfWDB2wYHLH3HAZc6DEqwnN2BKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDAdiY9IbgCSnH534XIbk5oSkMgpZq0W1pEerzWGMxk=;
 b=eRsSTXlchJSpGZtfUwn+lsojQUKWaCCSwMMsaLOD9WNCXxbD1SQ2A1WXOXXLHTVKWON8FxfT5t/levhxYDPSPmKa0ZRjG9F11SHXt0ICzYXYCeMTgwvwpuDtEhnzm7g9zErTQRkIIgQYYikkTTc7VVxN+UYeMmwaSXmf9FM2ShQ=
Received: from BYAPR05MB3960.namprd05.prod.outlook.com (2603:10b6:a02:88::12)
 by CY1PR05MB2473.namprd05.prod.outlook.com (2a01:111:e400:c618::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Thu, 1 Dec
 2022 15:14:20 +0000
Received: from BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::6764:941b:e0cc:c4e1]) by BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::6764:941b:e0cc:c4e1%7]) with mapi id 15.20.5857.022; Thu, 1 Dec 2022
 15:14:20 +0000
To: Stefano Garzarella <sgarzare@redhat.com>, Arseniy Krasnov
 <AVKrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v2 3/6] vsock/vmci: always return ENOMEM in case of
 error
Thread-Topic: [RFC PATCH v2 3/6] vsock/vmci: always return ENOMEM in case of
 error
Thread-Index: AQHZAPCA3ICEgU4zakSbW2G8CFeTF65YzU8AgABf+oA=
Date: Thu, 1 Dec 2022 15:14:20 +0000
Message-ID: <D7DE3103-994D-478E-B7F6-42CE8B6469FE@vmware.com>
References: <9d96f6c6-1d4f-8197-b3bc-8957124c8933@sberdevices.ru>
 <675b1f93-dc07-0a70-0622-c3fc6236c8bb@sberdevices.ru>
 <20221201093048.q2pradrgn5limcfb@sgarzare-redhat>
In-Reply-To: <20221201093048.q2pradrgn5limcfb@sgarzare-redhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR05MB3960:EE_|CY1PR05MB2473:EE_
x-ms-office365-filtering-correlation-id: 5cbd9221-e625-4f23-8e0f-08dad3aeb8b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GEae2zzhC0AnFy/emT9pgJIcmqvzirIyMfndBGadOQNgJupz2eFViT88ZXHTwPLR67R107SYte7h09AvXE1LVHV/PEL2PnCmAa7QEgVNbA4NRlgMX0R5pSNLc5l8wTe4UTBj2ZGczlcXQz/8J6jY7l89g/kHa0m97KuT+7K5Y0ThGHeux9OGqjzg4qSRsx99BdLCIIF7M672k56jKlkUEO5PEPirRA5pfkpjt7KEiqT6q1Cw8pvnqWvDRQvbusUoKiUmK1q0mBAfZpYW6HrK6rZ9LgO7XCRLUp+t/pHy80vruHFlW6EqStadgsUsNxCgrFDftLLLLj9TOgfz4pz1+ZSRw7aFOMvyP6zqFiMcg2bmyCgQeGgDWAxtngOA50rcEAQJpABjJClrt0YYYcjwdVG29BVvt+Ka/iMDUYJGPkTuPPLuYbdbjyYYb10QQ7jZgarF6SL2MWT46WWv3qGaqn4Rm0c1kSoXwhfGLLZtoqR/98qynPfyDQ7KIHaFrNoaNWsCbZBnF9drE0QilNfk8/ZgcA46UYyIgwwnf7J3rBIXd1yS4JiYLGCW8MpXxe9fcNQfnJSBNeJP8178c1jWwhPKcbSYzgmlfghcPHKbeovria8ZZpHs7rL1HfY4lvHsTFQyYr6zraZM6sNuTp8mdCB1Y6fjBM6jo4kvdN1faeJH4BytsW19L3r9ve12nJlQQD2KaRUwfzx69YvL2p8kDceWYELqXeu7D1aa4dlR9K3j01gtnJHHpxK2rocGq4FWNBBSad9b/FSDn7woTfkwuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB3960.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(36756003)(2906002)(38070700005)(41300700001)(6512007)(83380400001)(86362001)(2616005)(5660300002)(64756008)(4326008)(33656002)(76116006)(66946007)(66476007)(186003)(71200400001)(8676002)(66446008)(53546011)(7416002)(6506007)(66556008)(8936002)(38100700002)(110136005)(6486002)(122000001)(478600001)(54906003)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kmzg7aH3v+uXxmxm1snhpNnQ9NvvAPbIt92gy1rml+NCryzpJURV4tTYqb0J?=
 =?us-ascii?Q?Lb9hKpNRD2NDnNGxbDPXPQExBym4eGietJ7vcbTkMeH7V7IhdOBKYSoIZku4?=
 =?us-ascii?Q?Pz5r44cIO3OmfOrFNI2pflarEMoo2tDQQKzw7tC6DhJA/mjPKR6QY4YEzE0b?=
 =?us-ascii?Q?W18RfFvyemNGrtLohouO3LiftkvZPNGr7ywrbUpYR36jRLfRUQRSjWk+A20u?=
 =?us-ascii?Q?wRIHvryLsf8Rs8pAaCRoGg8Kc6H6lATjWmZ5S8D1UY1FZGzPgkJyj5AAu0nX?=
 =?us-ascii?Q?elUueal153dh0gRW4WL3/uUKpvdTwX6nt9ozjLX2RV4Db0RNDK1s0kCMUyvs?=
 =?us-ascii?Q?ydVreZcBsrkEBxmVORd51sThr1Ka+2ofRjEScOP1lk/8MDb9PY9XzPYzDD18?=
 =?us-ascii?Q?gjBwVNAzOMANFWhZXV4FWvP6f4cqcD+8kJBhi5ahV1fTnXhTC4/SN7noLQ+i?=
 =?us-ascii?Q?nyZfHIBlMvnCDdDpYP5Mpd1kKbJzblK2xXsVJRPRrss+2bFHb9o1edfCJW4e?=
 =?us-ascii?Q?RA2kAgE5T5WklK36IMSdltmQP7e/Ef3byTIQxQctzHc3yDXk++BSvS8giZTX?=
 =?us-ascii?Q?uONXrhKt1g3mfZOMSVLUnSVzMQq4KGDk5vi0hlulJzUmd613ltzFcHFqNi5e?=
 =?us-ascii?Q?An4YdfIP4/V4yWsQiwAFS2f8kM57XHAgW3QkImKbXuoZ1ndC2vR2z5J8icRm?=
 =?us-ascii?Q?CdgA0fpoTIoWT7J4qWnXvCZmcocCqjIvrX+QMw2eWRf9nPYQSK/4QjVwhvx1?=
 =?us-ascii?Q?gv0jgMxehQIwYEjvqElCs9XmguEpCvKFWE7NeiagVCEXoaxZVnF/MFaOVMIO?=
 =?us-ascii?Q?9l1fM498ApmsnmXvpeqLMdowt9SYwF9YHmqsirq+ySghNShbX1UVmMms14Gj?=
 =?us-ascii?Q?vaMMj4TlsoPDqNzzJQmZ7bEEdzxy/delv85MYuBnp2dP3e9/K6Cb+EA+Qxa6?=
 =?us-ascii?Q?4DTfiR1XwdSfe+9Ybxz6AE7WD+BELfPxwKlgLptBkskFSGnYCVmcKQje5N4V?=
 =?us-ascii?Q?D66QBg3g8cwhYb9PWM+Oa0M81hP1heud0FhS5LRJcTNGXl4QOf19smoY2h6R?=
 =?us-ascii?Q?jPX6zyAhc5xIJd8cMajZH3dYLwkH/DItWLFWS2w2ZyoeB88iDg8zvbm6GUbD?=
 =?us-ascii?Q?E5PTEAHS9hil81ux9Zr8ESzdio5DhiVS7di1c5L93kfm43T1o/V3hIJA76Hd?=
 =?us-ascii?Q?3odfn7fWNAZKoAwqUziOhp3nTcQWrVEVd/LG6Pjo32c52rMU0GTW18Omirpw?=
 =?us-ascii?Q?xaF6Db1MyRvTG9VyAtX2aueqd0iyIJl9QzFNwIeP4LrSg1l+XKTIDUMiUgpo?=
 =?us-ascii?Q?06RpwY+rKgKt7m28I58Yh/NC2+XLqJ7oAGt+2rwD6FOMCvFytGEPbjljgLHq?=
 =?us-ascii?Q?0b6aHoh4dYwUAiwerUgFTCwHtfCLZeNgfaQRAmWSSO4Z8OK00UEcX+NQlzeS?=
 =?us-ascii?Q?C6IEmg7w+QP9MAdiez5oz4idlCONdQYhMzJiK+pektbbLN+fxuh93rPEQckA?=
 =?us-ascii?Q?bVi0bUA1aVxq7UbbNEEmK/qibBMBWreD6PQgjBuXvjGQ4n3WfIfPwYrc1bMK?=
 =?us-ascii?Q?Mmj+cJN3G/lBlkeVAGCcaPhpCF4iYngl6jSMK9zBbCCu++Y5DijZKLeT0gcQ?=
 =?us-ascii?Q?tqKyirTJSYQiQBczsC3LTwZHxoTJKirfee3uipTc90QO?=
Content-ID: <A0D536CE63F6D9428AFA7750B19E3B41@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB3960.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbd9221-e625-4f23-8e0f-08dad3aeb8b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 15:14:20.2448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NgmDZiIZgcJyPgSlM4g6aCDdJIBVxKN3SM5VTgBCWZwtQIr4f6lgt76g51H71BhWYR5kRJQ535boMBzJWKcjGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR05MB2473
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bobby Eshleman <bobby.eshleman@bytedance.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Bobby Eshleman <bobby.eshleman@gmail.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Bryan Tan <bryantan@vmware.com>,
 "edumazet@google.com" <edumazet@google.com>,
 Krasnov Arseniy <oxffffaa@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 kernel <kernel@sberdevices.ru>, Jakub Kicinski <kuba@kernel.org>,
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



> On Dec 1, 2022, at 1:30 AM, Stefano Garzarella <sgarzare@redhat.com> wrote:
> 
> !! External Email
> 
> On Fri, Nov 25, 2022 at 05:08:06PM +0000, Arseniy Krasnov wrote:
>> From: Bobby Eshleman <bobby.eshleman@bytedance.com>
>> 
>> This saves original behaviour from af_vsock.c - switch any error
>> code returned from transport layer to ENOMEM.
>> 
>> Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>> ---
>> net/vmw_vsock/vmci_transport.c | 9 ++++++++-
>> 1 file changed, 8 insertions(+), 1 deletion(-)
> 
> @Bryan @Vishnu what do you think about this patch?
> 
> A bit of context:
> 
> Before this series, the af_vsock core always returned ENOMEM to the user
> if the transport failed to queue the packet.
> 
> Now we are changing it by returning the transport error. So I think here
> we want to preserve the previous behavior for vmci, but I don't know if
> that's the right thing.
> 

Agree with Stefano.  I don't think we need to preserve the previous
behavior for vmci.

> 
> @Arseniy please in the next versions describe better in the commit
> messages the reasons for these changes, so it is easier review for
> others and also in the future by reading the commit message we can
> understand the reason for the change.
> 
> Thanks,
> Stefano
> 
>> 
>> diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
>> index 842c94286d31..289a36a203a2 100644
>> --- a/net/vmw_vsock/vmci_transport.c
>> +++ b/net/vmw_vsock/vmci_transport.c
>> @@ -1838,7 +1838,14 @@ static ssize_t vmci_transport_stream_enqueue(
>>      struct msghdr *msg,
>>      size_t len)
>> {
>> -      return vmci_qpair_enquev(vmci_trans(vsk)->qpair, msg, len, 0);
>> +      int err;
>> +
>> +      err = vmci_qpair_enquev(vmci_trans(vsk)->qpair, msg, len, 0);
>> +
>> +      if (err < 0)
>> +              err = -ENOMEM;
>> +
>> +      return err;
>> }
>> 
>> static s64 vmci_transport_stream_has_data(struct vsock_sock *vsk)
>> --
>> 2.25.1
> 
> 
> !! External Email: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
