Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29A143917
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 10:07:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0AD2085C28;
	Tue, 21 Jan 2020 09:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVIM7Fp98iXI; Tue, 21 Jan 2020 09:07:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6846986430;
	Tue, 21 Jan 2020 09:07:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D12EC1D87;
	Tue, 21 Jan 2020 09:07:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86BE4C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6EC2D85C28
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnOcil5b6rcS
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:07:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 52BFE85BCA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579597636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aBt9kA8Q3sfLDPWSB6WPSmED3batQYaL6AuEX7S5BEo=;
 b=gjmhZB8VfzkQCPcB6tXhmtc0C3ToCJfn0qP/12MYn+L+sf360/xHslzZ3HmK8M6zqVUDcY
 AeMghAzd9q9gynjiLyIeXEyvNJ2E6XQJGuscM+jgi9MqeaaGTQQ1YPSUEbKkotLxKFP8Z6
 Nj995UiXUQ2C2CBsL7BGdBDBg1Rvc2Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Tkm7Nno0Ng6Ht1PSHtM8qA-1; Tue, 21 Jan 2020 04:07:11 -0500
Received: by mail-wm1-f71.google.com with SMTP id s25so230553wmj.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 01:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aBt9kA8Q3sfLDPWSB6WPSmED3batQYaL6AuEX7S5BEo=;
 b=DTHUpKP8GhOMzRGBvOG/u6xzI5ZiH0fkaodFvMZLk/znRr9wFL9eHFB2v9ZcC7w2U2
 7ZLcduGW9Ay/JN4pFKK5OnObvYjTENz2kG8tcdxLLiDVv/Eis4p1PAyr+C4TjdCQN8ul
 tvBbvMK1GaNRc11APqBQWFFZp9+4vv4aJNMJ4Wu/v+xv7p3WaIsvDgt/xePmC4GAkhwX
 Pd9H3kHuDM5MS4iZxI/qiWnKP6QDw3rG3K17WvQWdFHqhcVC9zAO1SILg7N4Hq4+cP6Y
 jtim4kRs4WBAL1lEGWeifmGTGioYcd0rZkSsM+RqbUZ15FRehCryWBzMeV30N90t1cHk
 0Csg==
X-Gm-Message-State: APjAAAXQYdfnp0qD6Elm+F5xAH/qU1tbI5oU3+TugtStqR8VMX98NmAh
 x4dajov6anqnC+0Jng09MAKB9kHjemwyT1cibOiYbAmYVwKKuB+caERLcHDLTuPaqQPwDHkpXwj
 tVDjVpkAuYRG16/qWPAYiqjTvEFFDawV7qDs7+u7eHA==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr4130262wrn.280.1579597630115; 
 Tue, 21 Jan 2020 01:07:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxU92Hbv50qsDxzXuliKOZgW+eihOR7bXFm+gNzrAyGGjKZoJ+jAUcQspYmZ2eK0Tb6M8FNyA==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr4130222wrn.280.1579597629862; 
 Tue, 21 Jan 2020 01:07:09 -0800 (PST)
Received: from steredhat (host84-49-dynamic.31-79-r.retail.telecomitalia.it.
 [79.31.49.84])
 by smtp.gmail.com with ESMTPSA id r68sm2990217wmr.43.2020.01.21.01.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 01:07:09 -0800 (PST)
Date: Tue, 21 Jan 2020 10:07:06 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <CAGxU2F4uW7FNe5xC0sb3Xxr_GABSXuu1Z9n5M=Ntq==T7MaaVw@mail.gmail.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
 <20200120170120-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200120170120-mutt-send-email-mst@kernel.org>
X-MC-Unique: Tkm7Nno0Ng6Ht1PSHtM8qA-1
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

On Mon, Jan 20, 2020 at 11:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Jan 20, 2020 at 05:53:39PM +0100, Stefano Garzarella wrote:
> > On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> > > > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > > > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > > > >
> > > > > > > > This patch adds 'netns' module param to enable this new feature
> > > > > > > > (disabled by default), because it changes vsock's behavior with
> > > > > > > > network namespaces and could break existing applications.
> > > > > > >
> > > > > > > Sorry, no.
> > > > > > >
> > > > > > > I wonder if you can even design a legitimate, reasonable, use case
> > > > > > > where these netns changes could break things.
> > > > > >
> > > > > > I forgot to mention the use case.
> > > > > > I tried the RFC with Kata containers and we found that Kata shim-v1
> > > > > > doesn't work (Kata shim-v2 works as is) because there are the following
> > > > > > processes involved:
> > > > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> > > > > >   passes it to qemu
> > > > > > - kata-shim (runs in a container) wants to talk with the guest but the
> > > > > >   vsock device is assigned to the init_netns and kata-shim runs in a
> > > > > >   different netns, so the communication is not allowed
> > > > > > But, as you said, this could be a wrong design, indeed they already
> > > > > > found a fix, but I was not sure if others could have the same issue.
> > > > > >
> > > > > > In this case, do you think it is acceptable to make this change in
> > > > > > the vsock's behavior with netns and ask the user to change the design?
> > > > >
> > > > > David's question is what would be a usecase that's broken
> > > > > (as opposed to fixed) by enabling this by default.
> > > >
> > > > Yes, I got that. Thanks for clarifying.
> > > > I just reported a broken example that can be fixed with a different
> > > > design (due to the fact that before this series, vsock devices were
> > > > accessible to all netns).
> > > >
> > > > >
> > > > > If it does exist, you need a way for userspace to opt-in,
> > > > > module parameter isn't that.
> > > >
> > > > Okay, but I honestly can't find a case that can't be solved.
> > > > So I don't know whether to add an option (ioctl, sysfs ?) or wait for
> > > > a real case to come up.
> > > >
> > > > I'll try to see better if there's any particular case where we need
> > > > to disable netns in vsock.
> > > >
> > > > Thanks,
> > > > Stefano
> > >
> > > Me neither. so what did you have in mind when you wrote:
> > > "could break existing applications"?
> >
> > I had in mind:
> > 1. the Kata case. It is fixable (the fix is not merged on kata), but
> >    older versions will not work with newer Linux.
>
> meaning they will keep not working, right?

Right, I mean without this series they work, with this series they work
only if the netns support is disabled or with a patch proposed but not
merged in kata.

>
> > 2. a single process running on init_netns that wants to communicate with
> >    VMs handled by VMMs running in different netns, but this case can be
> >    solved opening the /dev/vhost-vsock in the same netns of the process
> >    that wants to communicate with the VMs (init_netns in this case), and
> >    passig it to the VMM.
>
> again right now they just don't work, right?

Right, as above.

What do you recommend I do?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
