Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A8143052
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 17:53:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF6C2814A3;
	Mon, 20 Jan 2020 16:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCbAXfu-UKpJ; Mon, 20 Jan 2020 16:53:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1077484D8E;
	Mon, 20 Jan 2020 16:53:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 021CBC0174;
	Mon, 20 Jan 2020 16:53:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51CEBC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4DB2B875AD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXFdcMDvOWpO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:53:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3AC548759E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579539224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9t8MR+UrzdM1k7Ra8u+CTe/uTutPMJ8BLRkLhrkm60=;
 b=OlMShFZjn2OfXDDhDiN0YwT11+bjeuwmNaCW5eQOQBP+mlpcjXI8gmzAs9NI6Bz4BU60Mv
 jG2ZCcg5RKkZ2HoTXapx/s5spK3hPmJqnxe+BGgp4Zt9A93PlPxoDv206xUVHQHBzlZHP9
 0GTVDfgPlNCA/YphFGxLYPlwBwZn5u0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-dARPE2lbMW-V7FIEt416uw-1; Mon, 20 Jan 2020 11:53:43 -0500
Received: by mail-wr1-f69.google.com with SMTP id v17so55261wrm.17
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z9t8MR+UrzdM1k7Ra8u+CTe/uTutPMJ8BLRkLhrkm60=;
 b=adZjcfGdxYVSvHAtrtRyGfLazTevPfUu7y2jDcjQoIeoJ0ekVzETMIGHRooWlY3KQP
 Jbm1r80T/LZIA1b79FF1I1h2GSG5wb3DERUp3k0BvteIE+w51kdB6tfDzj0HD9zuNvf/
 vKwvspJHta/dl9IL0GpzD9hghH3uFq/FROud7gY68g7SbAUuBn+ZffiXztyKJPTDT2aH
 hZdEHbnW0dVxi9AUPkaeWQ0sbZhEdY+4NA72MBXk9i023UxXuDnn81iUcn9vm96v9V5e
 4Ymh5iL8hehv3GA9VjaX/FSHw7KMOvV1tMVdsb7j70RRRUOWuV/pWt1LB0DRF+4DskAK
 EBFA==
X-Gm-Message-State: APjAAAU/Gv1pL+51WwrGGdowK/v2ncp8adz+FZC7DLvdpTAI5zj9QZAi
 7EUWFWf6Rryt02kIQbxY5pfw56o/SjqJOGDklIGoRY4TCUeb6kcvIuEqt3cljZt5uKqT2OQlu67
 /N8DDB2fVUnYy74a4ry0HHTsy5P+6rAnDpAWp+coi0Q==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr440740wrm.324.1579539222680; 
 Mon, 20 Jan 2020 08:53:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNW66fPRfK7FwpLegFkuWKTwV9qDnkpodkOYc0ad9mcsdyNY8eyfpyGVBQ2vBixbwS4shXCg==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr440720wrm.324.1579539222372; 
 Mon, 20 Jan 2020 08:53:42 -0800 (PST)
Received: from steredhat (host84-49-dynamic.31-79-r.retail.telecomitalia.it.
 [79.31.49.84])
 by smtp.gmail.com with ESMTPSA id c2sm48389367wrp.46.2020.01.20.08.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 08:53:41 -0800 (PST)
Date: Mon, 20 Jan 2020 17:53:39 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200120110319-mutt-send-email-mst@kernel.org>
X-MC-Unique: dARPE2lbMW-V7FIEt416uw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 netdev@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, David Miller <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > >
> > > > > > This patch adds 'netns' module param to enable this new feature
> > > > > > (disabled by default), because it changes vsock's behavior with
> > > > > > network namespaces and could break existing applications.
> > > > >
> > > > > Sorry, no.
> > > > >
> > > > > I wonder if you can even design a legitimate, reasonable, use case
> > > > > where these netns changes could break things.
> > > >
> > > > I forgot to mention the use case.
> > > > I tried the RFC with Kata containers and we found that Kata shim-v1
> > > > doesn't work (Kata shim-v2 works as is) because there are the following
> > > > processes involved:
> > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> > > >   passes it to qemu
> > > > - kata-shim (runs in a container) wants to talk with the guest but the
> > > >   vsock device is assigned to the init_netns and kata-shim runs in a
> > > >   different netns, so the communication is not allowed
> > > > But, as you said, this could be a wrong design, indeed they already
> > > > found a fix, but I was not sure if others could have the same issue.
> > > >
> > > > In this case, do you think it is acceptable to make this change in
> > > > the vsock's behavior with netns and ask the user to change the design?
> > >
> > > David's question is what would be a usecase that's broken
> > > (as opposed to fixed) by enabling this by default.
> >
> > Yes, I got that. Thanks for clarifying.
> > I just reported a broken example that can be fixed with a different
> > design (due to the fact that before this series, vsock devices were
> > accessible to all netns).
> >
> > >
> > > If it does exist, you need a way for userspace to opt-in,
> > > module parameter isn't that.
> >
> > Okay, but I honestly can't find a case that can't be solved.
> > So I don't know whether to add an option (ioctl, sysfs ?) or wait for
> > a real case to come up.
> >
> > I'll try to see better if there's any particular case where we need
> > to disable netns in vsock.
> >
> > Thanks,
> > Stefano
>
> Me neither. so what did you have in mind when you wrote:
> "could break existing applications"?

I had in mind:
1. the Kata case. It is fixable (the fix is not merged on kata), but
   older versions will not work with newer Linux.

2. a single process running on init_netns that wants to communicate with
   VMs handled by VMMs running in different netns, but this case can be
   solved opening the /dev/vhost-vsock in the same netns of the process
   that wants to communicate with the VMs (init_netns in this case), and
   passig it to the VMM.

These cases can work with vsock+netns, but they require changes because
I'm modifying the vsock behavior with netns.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
