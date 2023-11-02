Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6DF7DF390
	for <lists.virtualization@lfdr.de>; Thu,  2 Nov 2023 14:20:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8893784F73;
	Thu,  2 Nov 2023 13:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8893784F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8aZonPF-x7n; Thu,  2 Nov 2023 13:20:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DC7E984F70;
	Thu,  2 Nov 2023 13:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC7E984F70
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1089BC008D;
	Thu,  2 Nov 2023 13:20:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC505C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Nov 2023 13:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B555743468
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Nov 2023 13:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B555743468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JA6pMcYMZgxe
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Nov 2023 13:20:12 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17B3243447
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Nov 2023 13:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17B3243447
Received: from dggpemm500018.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SLkbT1RWSzvQVW;
 Thu,  2 Nov 2023 21:04:05 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 2 Nov 2023 21:04:07 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2507.031;
 Thu, 2 Nov 2023 21:04:07 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: RE: virtcrypto_dataq_callback calls crypto_finalize_request() from
 irq context
Thread-Topic: virtcrypto_dataq_callback calls crypto_finalize_request() from
 irq context
Thread-Index: AQHZ7VsjRTMxo/hUEkmU1GjtoDjS1rAp3v1A///cYoCAO3GWgIACEayQ
Date: Thu, 2 Nov 2023 13:04:07 +0000
Message-ID: <5d9ebbdb042845009b47e6a9ee149231@huawei.com>
References: <20230922154546.4f7447ce.pasic@linux.ibm.com>
 <ed47fb73ad634ca395bd6c8e979dda8e@huawei.com>
 <20230924193941.6a02237f.pasic@linux.ibm.com>
 <20231101092521-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231101092521-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Marc Hartmayer <mhartmay@linux.ibm.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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
From: "Gonglei \(Arei\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Wednesday, November 1, 2023 9:26 PM
> To: Halil Pasic <pasic@linux.ibm.com>
> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; Jason Wang <jasowang@redhat.com>;
> virtualization@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
> linux-crypto@vger.kernel.org; Marc Hartmayer <mhartmay@linux.ibm.com>
> Subject: Re: virtcrypto_dataq_callback calls crypto_finalize_request() from irq
> context
> 
> On Sun, Sep 24, 2023 at 07:39:41PM +0200, Halil Pasic wrote:
> > On Sun, 24 Sep 2023 11:56:25 +0000
> > "Gonglei (Arei)" <arei.gonglei@huawei.com> wrote:
> >
> > > Hi Halil,
> > >
> > > Commit 4058cf08945 introduced a check for detecting crypto
> > > completion function called with enable BH, and indeed the
> > > virtio-crypto driver didn't disable BH, which needs a patch to fix it.
> > >
> > > P.S.:
> > > https://lore.kernel.org/lkml/20220221120833.2618733-5-clabbe@baylibr
> > > e.com/T/
> > >
> > > Regards,
> > > -Gonglei
> >
> > Thanks Gonglei!
> >
> > Thanks! I would be glad to test that fix on s390x. Are you about to
> > send one?
> >
> > Regards,
> > Halil
> 
> 
> Gonglei did you intend to send a fix?

Actually I sent a patch a month ago, pls see another thread.


Regards,
-Gonglei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
