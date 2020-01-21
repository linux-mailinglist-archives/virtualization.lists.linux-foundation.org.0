Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368F143F97
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 15:32:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C13FF204EA;
	Tue, 21 Jan 2020 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gH1w6VeKRAmI; Tue, 21 Jan 2020 14:32:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EAD6F2039C;
	Tue, 21 Jan 2020 14:32:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D93B9C0174;
	Tue, 21 Jan 2020 14:32:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9C8CC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 94E018754B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brdwjV4EenQo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:31:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1864823EE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579617111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9mF7S/CElHcPOzBiJE5ZLHPm54JjJRyvMZy7fUQh3+o=;
 b=NnNnaQaanfumYsmNsvScvYmoGERSc4ePxHlyig0UHJ1P1D3dhk4bXBzs0pqqjNGXqE6JfU
 Xn3JUYgB16+sdJmtErsByX83oCpeK2LNXYZ44fvRhcQTuIz2m9wW8gl8zKK3HyTEPMwreV
 p1NtqbblBECAY2/2Ye55pI5DmVpUQrE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-aF1aBeGFPBKTylP-4aVTSw-1; Tue, 21 Jan 2020 09:31:49 -0500
Received: by mail-qt1-f200.google.com with SMTP id m30so2015608qtb.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 06:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9mF7S/CElHcPOzBiJE5ZLHPm54JjJRyvMZy7fUQh3+o=;
 b=c07t1AVHEkFxXDWd31cTZO5wdLXTR53ew9HGt9CzWLmp++k+2EDU+3MKVsrOQstbUj
 3k7/xk51TMUVVJ0OhBh3/sTE1WmpOJHTIowmBmtvynZqNlY4hdUEe6jiLfxQRWO09npb
 qIlF/NFlZnkTer3kqSvoG3spN0YPI13mcjVBGq9si+FpcVCbbEqYM1NLESaN/67CxVsK
 dKA2u9RIXDAP1Tt/Rq2Y1t8B0q9PzJF9zJxGpuiAXwjDl78/NKycnFdo/+By4kqcuwIm
 kTjFM1KAWr0E9ruyuEonbuwUSZj4RrIKaejcga+r3HQxfWb9JIfh6FIU93vcfPyHYNf3
 p1fA==
X-Gm-Message-State: APjAAAUn4WlRpsE5pLaiud4px+3TNdhQ//AD0vU4AEvWFsg3kJyVUPiE
 C+yr/CmAqRILKhiR8xEpwUh0fXwFC8T2kH8uQ82jyW4mVdO2GQV+b1D+yhoHtXfvBdrZSoD5PGX
 3UO9EnxAHZR6GbG6AcO3BBtoihW2rENGufdacVVSnVQ==
X-Received: by 2002:ac8:461a:: with SMTP id p26mr4497794qtn.317.1579617108765; 
 Tue, 21 Jan 2020 06:31:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrIvrhaYu107gr5LRu833/t8f+udWCCk91EWLM5wPQlcLIaM9dNSDXl+N4W9nnEJsWqmVhTQ==
X-Received: by 2002:ac8:461a:: with SMTP id p26mr4497751qtn.317.1579617108435; 
 Tue, 21 Jan 2020 06:31:48 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id h13sm142713qtu.23.2020.01.21.06.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:31:47 -0800 (PST)
Date: Tue, 21 Jan 2020 09:31:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200121093104-mutt-send-email-mst@kernel.org>
References: <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
 <20200120170120-mutt-send-email-mst@kernel.org>
 <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
 <20200121135907.GA641751@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200121135907.GA641751@stefanha-x1.localdomain>
X-MC-Unique: aF1aBeGFPBKTylP-4aVTSw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 netdev@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Miller <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Tue, Jan 21, 2020 at 01:59:07PM +0000, Stefan Hajnoczi wrote:
> On Tue, Jan 21, 2020 at 10:07:06AM +0100, Stefano Garzarella wrote:
> > On Mon, Jan 20, 2020 at 11:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Mon, Jan 20, 2020 at 05:53:39PM +0100, Stefano Garzarella wrote:
> > > > On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> > > > > > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > > > > > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > > > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > > > > > >
> > > > > > > > > > This patch adds 'netns' module param to enable this new feature
> > > > > > > > > > (disabled by default), because it changes vsock's behavior with
> > > > > > > > > > network namespaces and could break existing applications.
> > > > > > > > >
> > > > > > > > > Sorry, no.
> > > > > > > > >
> > > > > > > > > I wonder if you can even design a legitimate, reasonable, use case
> > > > > > > > > where these netns changes could break things.
> > > > > > > >
> > > > > > > > I forgot to mention the use case.
> > > > > > > > I tried the RFC with Kata containers and we found that Kata shim-v1
> > > > > > > > doesn't work (Kata shim-v2 works as is) because there are the following
> > > > > > > > processes involved:
> > > > > > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> > > > > > > >   passes it to qemu
> > > > > > > > - kata-shim (runs in a container) wants to talk with the guest but the
> > > > > > > >   vsock device is assigned to the init_netns and kata-shim runs in a
> > > > > > > >   different netns, so the communication is not allowed
> > > > > > > > But, as you said, this could be a wrong design, indeed they already
> > > > > > > > found a fix, but I was not sure if others could have the same issue.
> > > > > > > >
> > > > > > > > In this case, do you think it is acceptable to make this change in
> > > > > > > > the vsock's behavior with netns and ask the user to change the design?
> > > > > > >
> > > > > > > David's question is what would be a usecase that's broken
> > > > > > > (as opposed to fixed) by enabling this by default.
> > > > > >
> > > > > > Yes, I got that. Thanks for clarifying.
> > > > > > I just reported a broken example that can be fixed with a different
> > > > > > design (due to the fact that before this series, vsock devices were
> > > > > > accessible to all netns).
> > > > > >
> > > > > > >
> > > > > > > If it does exist, you need a way for userspace to opt-in,
> > > > > > > module parameter isn't that.
> > > > > >
> > > > > > Okay, but I honestly can't find a case that can't be solved.
> > > > > > So I don't know whether to add an option (ioctl, sysfs ?) or wait for
> > > > > > a real case to come up.
> > > > > >
> > > > > > I'll try to see better if there's any particular case where we need
> > > > > > to disable netns in vsock.
> > > > > >
> > > > > > Thanks,
> > > > > > Stefano
> > > > >
> > > > > Me neither. so what did you have in mind when you wrote:
> > > > > "could break existing applications"?
> > > >
> > > > I had in mind:
> > > > 1. the Kata case. It is fixable (the fix is not merged on kata), but
> > > >    older versions will not work with newer Linux.
> > >
> > > meaning they will keep not working, right?
> > 
> > Right, I mean without this series they work, with this series they work
> > only if the netns support is disabled or with a patch proposed but not
> > merged in kata.
> > 
> > >
> > > > 2. a single process running on init_netns that wants to communicate with
> > > >    VMs handled by VMMs running in different netns, but this case can be
> > > >    solved opening the /dev/vhost-vsock in the same netns of the process
> > > >    that wants to communicate with the VMs (init_netns in this case), and
> > > >    passig it to the VMM.
> > >
> > > again right now they just don't work, right?
> > 
> > Right, as above.
> > 
> > What do you recommend I do?
> 
> Existing userspace applications must continue to work.
> 
> Guests are fine because G2H transports are always in the initial network
> namespace.
> 
> On the host side we have a real case where Kata Containers and other
> vsock users break.  Existing applications run in other network
> namespaces and assume they can communicate over vsock (it's only
> available in the initial network namespace by default).
> 
> It seems we cannot isolate new network namespaces from the initial
> network namespace by default because it will break existing
> applications.  That's a bummer.
> 
> There is one solution that maintains compatibility:
> 
> Introduce a per-namespace vsock isolation flag that can only transition
> from false to true.  Once it becomes true it cannot be reset to false
> anymore (for security).
> 
> When vsock isolation is false the initial network namespace is used for
> <CID, port> addressing.
> 
> When vsock isolation is true the current namespace is used for <CID,
> port> addressing.
> 
> I guess the vsock isolation flag would be set via a rtnetlink message,
> but I haven't checked.
> 
> The upshot is: existing software doesn't benefit from namespaces for
> vsock isolation but it continues to work!  New software makes 1 special
> call after creating the namespace to opt in to vsock isolation.
> 
> This approach is secure because whoever sets up namespaces can
> transition the flag from false to true and know that it can never be
> reset to false anymore.
> 
> Does this make sense to everyone?
> 
> Stefan

Anything wrong with a separate device? whoever opens it decides
whether netns will work ...

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
