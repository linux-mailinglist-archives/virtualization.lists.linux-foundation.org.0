Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A217E7E1EF2
	for <lists.virtualization@lfdr.de>; Mon,  6 Nov 2023 11:52:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2750E41465;
	Mon,  6 Nov 2023 10:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2750E41465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhJGvOIpMArr; Mon,  6 Nov 2023 10:52:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98EA941193;
	Mon,  6 Nov 2023 10:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98EA941193
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADD1DC008C;
	Mon,  6 Nov 2023 10:52:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01895C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 10:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D10C361130
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 10:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D10C361130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYdSqmD93EKm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 10:52:23 +0000 (UTC)
X-Greylist: delayed 2615 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Nov 2023 10:52:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4056111C
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B4056111C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 10:52:23 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qzwX7-00EXgv-7O; Mon, 06 Nov 2023 18:08:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Nov 2023 18:08:44 +0800
Date: Mon, 6 Nov 2023 18:08:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: [PATCH] crypto: virtio-crypto: call finalize with bh disabled
Message-ID: <ZUi7LNhFFAumgRZ2@gondor.apana.org.au>
References: <1914739e2de14ed396e5674aa2d4766c@huawei.com>
 <20230926184158.4ca2c0c3.pasic@linux.ibm.com>
 <adb0c5f790dc408887f9d98548373919@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adb0c5f790dc408887f9d98548373919@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pizhenwei@bytedance.com" <pizhenwei@bytedance.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Nov 02, 2023 at 01:01:09PM +0000, Gonglei (Arei) wrote:
>
> > So I think the core of this question is: Can we call crypto_finalize_request() in
> > the upper half of the interrupt?

The finalize path originates from the network stack.  So the conditions
are the same as that of the network stack receive side.  That means
hard IRQ paths are unacceptable but softirq is OK.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
