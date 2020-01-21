Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A81143DBD
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 14:13:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6154720013;
	Tue, 21 Jan 2020 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B3RpgrA1SGV3; Tue, 21 Jan 2020 13:13:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9301B20337;
	Tue, 21 Jan 2020 13:13:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F58DC1D88;
	Tue, 21 Jan 2020 13:13:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3C05C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CF6E6857D8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8jVCFJ7FHQx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:13:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE65285660
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579612400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bm6ddKCO7VQlppCqWI0nKfN86LSegXbIAkNREeCapWU=;
 b=TyE0a01MzNw+MFtV79f2KVd9316gtR7OfuQK2VBtJGteNduoP37rUuNjrD1WzYqwViPynq
 WCaCwaQEa/pG+gTbQHXz/bWbBmT+ZZtpLSMv6/ZkGip5XhHSImpZwgcvEZJpml2m7Xr7B3
 oz6zKQzimIaXVIFcuWrQ0baf+L1Znyc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-G3eAB-_BNBaM0wEnB6ZD2A-1; Tue, 21 Jan 2020 08:13:17 -0500
Received: by mail-wm1-f69.google.com with SMTP id 7so371594wmf.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 05:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bm6ddKCO7VQlppCqWI0nKfN86LSegXbIAkNREeCapWU=;
 b=q3sMz+yTlxRynWWg8cTIalYAPaKVsnm4nyIgJxP5UYGH3WbbnHkObY3DZDO75WZvpS
 820oqWw2gfrJLlF1bdHwfDUnv/IG4q5dB7dGkzJmFv+5H0IZJ7vz9F0kNBBqa5GRZWbf
 EGugU3AUtzjCcyVMwbGM5ftlcOaQy6qx+VMJbPMq5txmAttLw11V+VnbsjDWZTvP75JW
 /Jx3tRX6P3HQIv+MwMHnh+c35kCQnfIHXdF4woJ4otcwvKZ/Ex2R0U6fPFC6uSYp+WMN
 7p+ST3NtjE+UCHL3trRJlVCWHY8LWaUyiZ9hen1ckG5K0YYz7ghpXq7zHNQOTjkEBwlV
 /UhA==
X-Gm-Message-State: APjAAAUtYzCnVN6FGvajW3e+qBFJzCGlt7n16PLQoFNgxdcmn0d2C9Rd
 bPnooHxUYor4LFRP3SJhwfz/hxcbpugC+ESAvgnPSthCaUyCMxb50sefSpU//e7WBUUM2wAMIYj
 CAhnwbAEItjFnrYK2Pay9GSXPiooBjPys6ds33Ussgg==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr5445455wrv.302.1579612396252; 
 Tue, 21 Jan 2020 05:13:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwymXXQZOjbORIMA0cxvCm/5PHfeqOk5X4LFnVOkEvDpjGvEEDvp8HpuokWl0ML8Wkw3YfvnA==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr5445417wrv.302.1579612395941; 
 Tue, 21 Jan 2020 05:13:15 -0800 (PST)
Received: from steredhat (host84-49-dynamic.31-79-r.retail.telecomitalia.it.
 [79.31.49.84])
 by smtp.gmail.com with ESMTPSA id o4sm50707386wrx.25.2020.01.21.05.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:13:15 -0800 (PST)
Date: Tue, 21 Jan 2020 14:13:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200121131312.wcwlsfljunzqopph@steredhat>
References: <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
 <20200120170120-mutt-send-email-mst@kernel.org>
 <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
 <20200121055403-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200121055403-mutt-send-email-mst@kernel.org>
X-MC-Unique: G3eAB-_BNBaM0wEnB6ZD2A-1
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

On Tue, Jan 21, 2020 at 06:14:48AM -0500, Michael S. Tsirkin wrote:
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
> > 
> > Thanks,
> > Stefano
> 
> If this breaks userspace, then we need to maintain compatibility.
> For example, have two devices, /dev/vhost-vsock and /dev/vhost-vsock-netns?

Interesting!

So, VMs handled with /dev/vhost-vsock will be reachable from any netns (as
it happens now) and VMs handled with /dev/vhost-vsock-netns will be
reachable only from the same netns of the process that opens it.

It requires more changes, but we will preserve the previous behavior,
adding the new feature!

Thanks a lot for this idea! I'll try to implement it!
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
