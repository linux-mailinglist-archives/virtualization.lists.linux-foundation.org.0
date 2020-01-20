Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB214339A
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 23:02:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92DD58608B;
	Mon, 20 Jan 2020 22:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIwLEhPOvY-c; Mon, 20 Jan 2020 22:02:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B108D85B8A;
	Mon, 20 Jan 2020 22:02:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8326EC0174;
	Mon, 20 Jan 2020 22:02:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E3D5C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 22:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 15CD08573E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 22:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLpLutlr6VDb
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 22:02:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 293A1856F4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579557731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqEmL/GgShVVHjMvVQbxK02T5LT7/TkxslI85eRWNwQ=;
 b=R6HHob/Oa9awO6E6Z/e+S5TrNem4jCBBH/DsVgbciX+mcbbFTfS6c64QEppnVnwiHwZDwc
 CV/wUWmeXkl2cSPYu4I1uYQjL5/LMJSzkTTyC2P/2WUBXVOOno7ITwOv5hoiJz4XPCDnO5
 WEb93WucDiXIsAm7Pkxg1eAF4mrXw3M=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-dbS4GNg_Nz-soQy61qp81Q-1; Mon, 20 Jan 2020 17:02:10 -0500
Received: by mail-qt1-f197.google.com with SMTP id l25so680327qtu.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 14:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aqEmL/GgShVVHjMvVQbxK02T5LT7/TkxslI85eRWNwQ=;
 b=BRoc5wEsGE04UgZZpvvhVrpY4Lv35H7XXX7jEkmvhl3KgwD2tnZQY/FOIJIR38KuQJ
 MtrQxaZJEl05plJDqHCkZAr369DaIb+hZ69r0Q2K47uKKpt+2w3VfkoAxzN5eyCdwNod
 cvjDNZA6LpFMTdf4cMtlaLXfgXFGfg4FMmgPlQXRDvx5TPA3ESqEDveDhM4rfRtCbYwy
 zYiDrujYaHV5R5S7LJW3WMGloQENRML2MQv90MzjEfbU0vhck8rX6LI6LFyEDmiBFU/X
 hVBIh5Vj8CMc/0sG/q27mSNW3iWTtWunbquWabuiuqagrEneX/YmTRJbZK5aIjb7+oq8
 wlPA==
X-Gm-Message-State: APjAAAV39UtFAp+TwKKuOD01lmQ+TjwxeH5GUMDT+i2VW863hfzmhF2s
 Dna/RLHLufossLHQHFzGa4mjDEWklR5ciXbS9fz+eEY2h48NnpQYowI62xgH8yMYtieEZoN061S
 3OIaB1BYkQWcuyY9yxF+P0UCjnK3aCClpy0/NjXDcWA==
X-Received: by 2002:ac8:34b4:: with SMTP id w49mr1592067qtb.24.1579557730125; 
 Mon, 20 Jan 2020 14:02:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqymqhWHdBCdsG0obySehjwIz92dnU8ErB6tNKIxW2hEWyp5GKWcYVwAyPzD6sgL2fT0CICj9w==
X-Received: by 2002:ac8:34b4:: with SMTP id w49mr1592040qtb.24.1579557729868; 
 Mon, 20 Jan 2020 14:02:09 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id s26sm16735731qkj.24.2020.01.20.14.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 14:02:08 -0800 (PST)
Date: Mon, 20 Jan 2020 17:02:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200120170120-mutt-send-email-mst@kernel.org>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
 <20200120060601-mutt-send-email-mst@kernel.org>
 <CAGxU2F6VH8Eb5UH_9KjN6MONbZEo1D7EHAiocVVus6jW55BJDg@mail.gmail.com>
 <20200120110319-mutt-send-email-mst@kernel.org>
 <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F5=DQJ56sH4BUqp_7rvaXSF9bFHp4QkpLApJQK0bmd4MA@mail.gmail.com>
X-MC-Unique: dbS4GNg_Nz-soQy61qp81Q-1
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

On Mon, Jan 20, 2020 at 05:53:39PM +0100, Stefano Garzarella wrote:
> On Mon, Jan 20, 2020 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Mon, Jan 20, 2020 at 02:58:01PM +0100, Stefano Garzarella wrote:
> > > On Mon, Jan 20, 2020 at 1:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> > > > > On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > > > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > > > > >
> > > > > > > This patch adds 'netns' module param to enable this new feature
> > > > > > > (disabled by default), because it changes vsock's behavior with
> > > > > > > network namespaces and could break existing applications.
> > > > > >
> > > > > > Sorry, no.
> > > > > >
> > > > > > I wonder if you can even design a legitimate, reasonable, use case
> > > > > > where these netns changes could break things.
> > > > >
> > > > > I forgot to mention the use case.
> > > > > I tried the RFC with Kata containers and we found that Kata shim-v1
> > > > > doesn't work (Kata shim-v2 works as is) because there are the following
> > > > > processes involved:
> > > > > - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
> > > > >   passes it to qemu
> > > > > - kata-shim (runs in a container) wants to talk with the guest but the
> > > > >   vsock device is assigned to the init_netns and kata-shim runs in a
> > > > >   different netns, so the communication is not allowed
> > > > > But, as you said, this could be a wrong design, indeed they already
> > > > > found a fix, but I was not sure if others could have the same issue.
> > > > >
> > > > > In this case, do you think it is acceptable to make this change in
> > > > > the vsock's behavior with netns and ask the user to change the design?
> > > >
> > > > David's question is what would be a usecase that's broken
> > > > (as opposed to fixed) by enabling this by default.
> > >
> > > Yes, I got that. Thanks for clarifying.
> > > I just reported a broken example that can be fixed with a different
> > > design (due to the fact that before this series, vsock devices were
> > > accessible to all netns).
> > >
> > > >
> > > > If it does exist, you need a way for userspace to opt-in,
> > > > module parameter isn't that.
> > >
> > > Okay, but I honestly can't find a case that can't be solved.
> > > So I don't know whether to add an option (ioctl, sysfs ?) or wait for
> > > a real case to come up.
> > >
> > > I'll try to see better if there's any particular case where we need
> > > to disable netns in vsock.
> > >
> > > Thanks,
> > > Stefano
> >
> > Me neither. so what did you have in mind when you wrote:
> > "could break existing applications"?
> 
> I had in mind:
> 1. the Kata case. It is fixable (the fix is not merged on kata), but
>    older versions will not work with newer Linux.

meaning they will keep not working, right?

> 2. a single process running on init_netns that wants to communicate with
>    VMs handled by VMMs running in different netns, but this case can be
>    solved opening the /dev/vhost-vsock in the same netns of the process
>    that wants to communicate with the VMs (init_netns in this case), and
>    passig it to the VMM.

again right now they just don't work, right?

> These cases can work with vsock+netns, but they require changes because
> I'm modifying the vsock behavior with netns.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
