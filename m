Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE558D250
	for <lists.virtualization@lfdr.de>; Tue,  9 Aug 2022 05:17:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46838404BB;
	Tue,  9 Aug 2022 03:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46838404BB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z/zV5QLD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xceIG6IIFTgJ; Tue,  9 Aug 2022 03:17:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B31DF40489;
	Tue,  9 Aug 2022 03:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B31DF40489
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD8A6C007B;
	Tue,  9 Aug 2022 03:17:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A30BC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Aug 2022 03:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F0B060B51
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Aug 2022 03:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0B060B51
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z/zV5QLD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4RvTtWqxb6p
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Aug 2022 03:17:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF66060B4F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF66060B4F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Aug 2022 03:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660015028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hku1ARqVHLsqVqdvmF+LjymmoxAfWd7fJEwt8euY7i0=;
 b=Z/zV5QLDemmKIISnVp1STvTOv6rPulWHZxk10JSrXTepChG94Rxs+w9cDtIUGFbLB0zZs7
 OEvmEj0IyHKBqdRNhpyj//QcsfuRCuQRIPFk5sPjGTVngSR+OOGEzzdfu76a6pGM7b8fe1
 wVVuUnjO7we+uWgOEiLAvsqSKzZbp9o=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-YdWSmTOIMfeiNk6pKLAe7A-1; Mon, 08 Aug 2022 23:17:07 -0400
X-MC-Unique: YdWSmTOIMfeiNk6pKLAe7A-1
Received: by mail-lj1-f198.google.com with SMTP id
 y10-20020a2eb00a000000b0025e505fc2c4so2999920ljk.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Aug 2022 20:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hku1ARqVHLsqVqdvmF+LjymmoxAfWd7fJEwt8euY7i0=;
 b=whP4nCPuJJrF1N5rzZ1dqZRCaqHIwgBQlvGZ6nf/Ngx3YTJXabeftJROOapLF7G9+Z
 +y+DZSO0gGltCb/4TiYRdGFPwviJVAYfemPmUeAte6r8SJYD955Jcvs254zEQcJHYmSe
 ZfIRoBBZBMWXNSMDz0seo7aiKzEr6iIV9SwHTnXyHFEzLTZ4jrSGuVKs5oHH7AKarKks
 iIBMr+GXcoAmjAAafaBWx24j/JnPhz7WQuaLmExywQIQyUZyeBe+oNGKPFFefuWJneZY
 K9gBgJnGDWUdLolWgo4KF7+Pvx6m7nDmPjyhQhaUDeTJIal0jfOx/q8Dj9iThppQtemc
 wBZQ==
X-Gm-Message-State: ACgBeo1wa0XoPOZ64rEtPUEXjJlMNUlZgVXL8tr8ConMFxfQ7mHXyaLK
 px8EYtvyi5Do4OG9t3GL+DRYPL4fWR/Qdt3JVGH5Twaj6S/xb5Qlu4K37IeaqMhZdlE0Fj59MvG
 83BwXdzgludsjGt4P1cdLs19aSssaKyJKmF1Do/NKWF/XI5/aGhbCDDLEOQ==
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr7802376lfl.641.1660015026053; 
 Mon, 08 Aug 2022 20:17:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IIJpQH67XtqBk2btElSlMlkfd1jKVQZZDaJZRMuF0mI0fTAKzJBNGyrFKYdgj7FYSxj45QVLxamo/Nzjw/oE=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr7802355lfl.641.1660015025739; Mon, 08
 Aug 2022 20:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220805181105.GA29848@willie-the-truck>
 <20220807042408-mutt-send-email-mst@kernel.org>
 <20220808101850.GA31984@willie-the-truck>
 <20220808083958-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220808083958-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 11:16:54 +0800
Message-ID: <CACGkMEv2vij4bSOwxajXan=+b_aQ_=Y3Ttjj3H9R_Q5fhEFxtg@mail.gmail.com>
Subject: Re: IOTLB support for vhost/vsock breaks crosvm on Android
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: jiyong@google.com, kvm <kvm@vger.kernel.org>, kernel-team@android.com,
 Will Deacon <will@kernel.org>, Keir Fraser <keirf@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>, ascull@google.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Marc Zyngier <maz@kernel.org>,
 crosvm-dev@chromium.org, Linus Torvalds <torvalds@linux-foundation.org>
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

On Mon, Aug 8, 2022 at 8:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Aug 08, 2022 at 11:18:50AM +0100, Will Deacon wrote:
> > Hi Michael,
> >
> > On Sun, Aug 07, 2022 at 09:14:43AM -0400, Michael S. Tsirkin wrote:
> > > Will, thanks very much for the analysis and the writeup!
> >
> > No problem, and thanks for following up.
> >
> > > On Fri, Aug 05, 2022 at 07:11:06PM +0100, Will Deacon wrote:
> > > > So how should we fix this? One possibility is for us to hack crosvm to
> > > > clear the VIRTIO_F_ACCESS_PLATFORM flag when setting the vhost features,
> > > > but others here have reasonably pointed out that they didn't expect a
> > > > kernel change to break userspace. On the flip side, the offending commit
> > > > in the kernel isn't exactly new (it's from the end of 2020!) and so it's
> > > > likely that others (e.g. QEMU) are using this feature.
> > >
> > > Exactly, that's the problem.
> > >
> > > vhost is reusing the virtio bits and it's only natural that
> > > what you are doing would happen.
> > >
> > > To be precise, this is what we expected people to do (and what QEMU does):
> > >
> > >
> > > #define QEMU_VHOST_FEATURES ((1 << VIRTIO_F_VERSION_1) |
> > >                          (1 << VIRTIO_NET_F_RX_MRG) | .... )
> > >
> > > VHOST_GET_FEATURES(... &host_features);
> > > host_features &= QEMU_VHOST_FEATURES
> > > VHOST_SET_FEATURES(host_features & guest_features)
> > >
> > >
> > > Here QEMU_VHOST_FEATURES are the bits userspace knows about.
> > >
> > > Our assumption was that whatever userspace enables, it
> > > knows what the effect on vhost is going to be.
> > >
> > > But yes, I understand absolutely how someone would instead just use the
> > > guest features. It is unfortunate that we did not catch this in time.
> > >
> > >
> > > In hindsight, we should have just created vhost level macros
> > > instead of reusing virtio ones. Would address the concern
> > > about naming: PLATFORM_ACCESS makes sense for the
> > > guest since there it means "whatever access rules platform has",
> > > but for vhost a better name would be VHOST_F_IOTLB.
> > > We should have also taken greater pains to document what
> > > we expect userspace to do. I remember now how I thought about something
> > > like this but after coding this up in QEMU I forgot to document this :(
> > > Also, I suspect given the history the GET/SET features ioctl and burned
> > > wrt extending it and we have to use a new when we add new features.
> > > All this we can do going forward.
> >
> > Makes sense. The crosvm developers are also pretty friendly in my
> > experience, so I'm sure they wouldn't mind being involved in discussions
> > around any future ABI extensions. Just be aware that they _very_ recently
> > moved their mailing lists, so I think it lives here now:
> >
> > https://groups.google.com/a/chromium.org/g/crosvm-dev
> >
> > > But what can we do about the specific issue?
> > > I am not 100% sure since as Will points out, QEMU and other
> > > userspace already rely on the current behaviour.
> > >
> > > Looking at QEMU specifically, it always sends some translations at
> > > startup, this in order to handle device rings.
> > >
> > > So, *maybe* we can get away with assuming that if no IOTLB ioctl was
> > > ever invoked then this userspace does not know about IOTLB and
> > > translation should ignore IOTLB completely.
> >
> > There was a similar suggestion from Stefano:
> >
> > https://lore.kernel.org/r/20220806105225.crkui6nw53kbm5ge@sgarzare-redhat
> >
> > about spotting the backend ioctl for IOTLB and using that to enable
> > the negotiation of F_ACCESS_PLATFORM. Would that work for qemu?
>
> Hmm I would worry that this disables the feature for old QEMU :(
>
>
> > > I am a bit nervous about breaking some *other* userspace which actually
> > > wants device to be blocked from accessing memory until IOTLB
> > > has been setup. If we get it wrong we are making guest
> > > and possibly even host vulnerable.
> > > And of course just revering is not an option either since there
> > > are now whole stacks depending on the feature.
> >
> > Absolutely, I'm not seriously suggesting the revert. I just did it locally
> > to confirm the issue I was seeing.
> >
> > > Will I'd like your input on whether you feel a hack in the kernel
> > > is justified here.
> >
> > If we can come up with something that we have confidence in and won't be a
> > pig to maintain, then I think we should do it, but otherwise we can go ahead
> > and change crosvm to mask out this feature flag on the vhost side for now.
> > We mainly wanted to raise the issue to illustrate that this flag continues
> > to attract problems in the hope that it might inform further usage and/or
> > spec work in this area.
> >
> > In any case, I'm happy to test any kernel patches with our setup if you
> > want to give it a shot.
>
> Thanks!
> I'm a bit concerned that the trick I proposed changes the configuration
> where iotlb was not set up from "access to memory not allowed" to
> "access to all memory allowed". This just might have security
> implications if some application assumed the former.
> And the one Stefano proposed disables IOTLB for old QEMU versions.

Yes, if there is no choice, having some known cases that are broken is
better than silently breaking unknown setups.

Thanks

>
>
>
> > > Also yes, I think it's a good idea to change crosvm anyway.  While the
> > > work around I describe might make sense upstream I don't think it's a
> > > reasonable thing to do in stable kernels.
> > > I think I'll prepare a patch documenting the legal vhost features
> > > as a 1st step even though crosvm is rust so it's not importing
> > > the header directly, right?
> >
> > Documentation is a good idea regardless, so thanks for that. Even though
> > crosvm has its own bindings for the vhost ioctl()s, the documentation
> > can be reference or duplicated once it's available in the kernel headers.
> >
> > Will
>
> So for crosvm change, I will post the documentation change and
> you guys can discuss?
>
> --
> MST
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
