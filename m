Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEFA6B7FEC
	for <lists.virtualization@lfdr.de>; Mon, 13 Mar 2023 19:05:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30E460A69;
	Mon, 13 Mar 2023 18:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30E460A69
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QWADTLVQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTD_1Caa4XKP; Mon, 13 Mar 2023 18:05:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F47260FBA;
	Mon, 13 Mar 2023 18:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F47260FBA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F7B0C008A;
	Mon, 13 Mar 2023 18:05:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A04A3C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Mar 2023 18:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67A81818BE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Mar 2023 18:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A81818BE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=QWADTLVQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tjryi5ejC9TM
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Mar 2023 18:05:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4126181970
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4126181970
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Mar 2023 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
 :Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=G/ko5TGzuHEcgDJnamjpPEj0WHGMkQQVi8DJaI/SzYg=; b=QWADTLVQC188kv7oMbz4BHRYWc
 71WvmVgDBgXZR0ElQENg9v47nhT0sb7lTKLwph5P7XyH2GLBtfqGT+RNX6GsXSMSfD13TnQ5aPrRG
 CjXvEN34naTsP+EDdHO+a5mJJmUlcnG3I0FF4FYUiGBtNpG50K2RuWqC2BdUmWCKZxzleT6f2Cbd9
 dEvgDXovnxWdgy8/pk0byGAokVdVA7chwUS0yYjmvc6kr4JGIGtY2FwLMY+NzAnJyKhfngyRzRAQP
 zbyV4QKaoEUWvfq2FFU4TF4mVDG+yktLc0HGO4rbG3G528Yn5bQhz1cSw0jsrIP23K+7Rp8aWaan9
 HWFCgBlQ==;
Received: from [54.239.6.189] (helo=[192.168.11.210])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pbmXp-001Tlb-1s; Mon, 13 Mar 2023 18:05:13 +0000
Message-ID: <5441d09dc213998042a337b7f411bd1662b604bc.camel@infradead.org>
Subject: Re: [PATCH v2 0/2] [RFC] virtio-rng entropy leak reporting feature
From: Amit Shah <amit@infradead.org>
To: bchalios@amazon.es, "Jason A. Donenfeld" <Jason@zx2c4.com>, Olivia
 Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-crypto@vger.kernel.org,  linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,  sgarzare@redhat.com,
 amit@kernel.org, graf@amazon.de, xmarcalx@amazon.co.uk
Date: Mon, 13 Mar 2023 19:05:11 +0100
In-Reply-To: <e1c03136-b873-1f1d-8b06-d9186566fc0c@amazon.es>
References: <20230131145543.86369-1-bchalios@amazon.es>
 <Y9lBeymca9eFaJ33@zx2c4.com>
 <65d872db2e1be29bb03b43ed606e7cc9e74ec08d.camel@infradead.org>
 <e1c03136-b873-1f1d-8b06-d9186566fc0c@amazon.es>
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
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

Hey Herbert / Jason / crypto maintainers,


On Mon, 2023-03-13 at 11:42 +0100, bchalios@amazon.es wrote:
> Hi Amit,
> 
> Thanks for taking the time to look into this.
> 
> On 3/2/23 5:55 PM, Amit Shah <amit@infradead.org> wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > Hey all,
> > 
> > On Tue, 2023-01-31 at 17:27 +0100, Jason A. Donenfeld wrote:
> > > You sent a v2, but I'm not back until the 11th to provide comments on
> > > v1. I still think this isn't the right direction, as this needs tie-ins
> > > to the rng to actually be useful. Please stop posting new versions of
> > > this for now, so that somebody doesn't accidentally merge it; that'd be
> > > a big mistake. I'll paste what I wrote you prior:
> > 
> > I sat down to review the patchset but looks like there's some
> > background I'm not aware of.
> > 
> > It looks like Babis has implemented the guest side here according to
> > the spec change that Michael has posted.
> > 
> > Jason, do you have an alternative in mind?  In that case, we should
> > pick this up in the spec update thread instead.
> 
> I am not sure what Jason meant here by "This needs to be integrated more closely with random.c itself, similar to how vmgenid works",
> but here's my take on this.
> 
> The point of the patchset is to provide an implementation of Michael's spec on which we can discuss. It implements the HW API and it has
> some hooks showing how this API could be used. It is mainly directed towards the user-space where we did not have a proper API to consume
> VMGENID-like functionality. With regards to the random.c components it does exactly what VMGENID does currently, i.e. whenever an entropy-leak
> is detected it uses the new random bytes provided by the virtio-rng device as entropy. This is as racy as VMGENID, as I mention in the cover
> letter of the patchset.

Yea, this does solve the race condition from the userspace pov, so does
look better.  Thanks for the details!

Not sure if Jason's back yet - but Herbert, or other crypto
maintainers, can you chime in from the crypto/rng perspective if this
looks sane?

Jason has previously NACKed the patch without follow-up, and I don't
want the patch to linger without a path to merging, especially when
it's not clear what Jason meant.

> However, the new spec does allow us to do things _correctly_, i.e. not rely on asynchronous handling of events to re-seed the kernel. For example, we
> could achieve something like that by making use of the "copy-on-leak" operation, so that a flag changes value before vCPUs get resumed, so we know
> when a leak has happened when needed, e.g. before returning random bytes to user-space. At least, that's what I remember us discussing during LPC.
> Jason, Michael, Alex, please keep me honest here :)
> 
> Unfortunately, I am not very familiar with the random.c code and did not want to do something there that would most certainly be wrong, hence I posted
> this as an RFC, asking for input on how we could achieve this better integration. Hopefully, when Jason is back from his vacation he can share his thoughts
> on this, but if yourself (or anyone else interested) have any ideas on how we could design this properly, I 'm happy to discuss!

Let's wait a couple more days for responses, otherwise I suggest you
resubmit to kickstart a new discussion, with the note that Jason had
something else in mind - so that it doesn't appear as though we're
trying to override that.

Thanks for the patience,

		Amit
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
