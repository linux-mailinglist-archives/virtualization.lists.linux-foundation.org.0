Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179A11D39A
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:18:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3ADD924F43;
	Thu, 12 Dec 2019 17:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvcFI4GS7YLr; Thu, 12 Dec 2019 17:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0DB4424F3A;
	Thu, 12 Dec 2019 17:18:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4696C0881;
	Thu, 12 Dec 2019 17:18:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC42BC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C229624CEB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3+KP4mIi66hm
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:18:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id AFBF424A5A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576171119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsg3QPVIKmvoEtnF+KPP+eqgxRi12jHq/JWtsfBsARA=;
 b=NYf77bu4nWdeHaI1EpiE3TcV8iF2IgZxguNWSCDTulB6OKwbFtUDjSVg0zfckloV93SJZ4
 0H0wdoRcbkuknlE5C8x1huYyhl5DQeHEumFOaDiR5qp4BNK96Jgpjo3i8u94nILqdNT2g0
 ZkZ7TRh9HcJ8aSq41ZdNBN38IaIuWy8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-JAyQeamKOvmuzteKjAQzpQ-1; Thu, 12 Dec 2019 12:18:37 -0500
Received: by mail-wr1-f69.google.com with SMTP id k18so1288716wrw.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 09:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w+lNpQbi7n9NjMFW1p/6ELUJOEe40X4isyqspjvYH6E=;
 b=pDCHXi4IYMadTHqaHEPwIqxsEEyDTrNqkKCHupmCFwVtWdKBkhIj14Q+XweZ2Ys7WW
 /qR7T/HiuQjJtnWkpVQ9zVZycu5HpdSVSgrCAMolJOTJXve115ucy9qTzl3zCH6zBWB2
 q6tuURs2KGjro+47q2ytuTkwtEiNZ8fMZ4FziPRzfjBkyvD+mkIkChbkgplib0wPwhPA
 pM3XypDVgT7/lVBw3lhNeFqrjethMGFkUgLZx8cqPMTV5R9wwVdHsQ1MJ1MLLkKQfzMp
 WFtUEUbzba64FeK3BkzmikMDuQarjOeVB1O7YVqyktAscPYwR/RHp5U4T91NCy4tKLc5
 HkSw==
X-Gm-Message-State: APjAAAXOiiJbuc4SP1TLA5S9ME0o0xOHyhcNNCoaExjSI/t00bfenG+U
 WK7I7cwjXsfG85rIpedcAZv3+W+WphxZh5CgKQpqBiWNBkFjMNRzJSQLBb2dOMJ80JrZ+e8HwSN
 ZwsZdXv/Vf3VZsmPS++ZaHgWjc6zt4QSw3NuO3pYhjQ==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr7640199wrc.175.1576171116419; 
 Thu, 12 Dec 2019 09:18:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdf/lJae5vRRMQuAYB1NsUfS2ri+yj2mZtXoOp6zeDlaXOa3l7O6kmQWVGurWJ+dIsn9JABg==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr7640165wrc.175.1576171116091; 
 Thu, 12 Dec 2019 09:18:36 -0800 (PST)
Received: from steredhat ([95.235.120.92])
 by smtp.gmail.com with ESMTPSA id h2sm6702690wrv.66.2019.12.12.09.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 09:18:35 -0800 (PST)
Date: Thu, 12 Dec 2019 18:18:32 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <CAGxU2F5KYABXjATchcqw_rA13cyUzug0zrGX6TJX2CLqj9ZwGw@mail.gmail.com>
References: <20191206143912.153583-1-sgarzare@redhat.com>
 <20191211110235-mutt-send-email-mst@kernel.org>
 <20191212123624.ahyhrny7u6ntn3xt@steredhat>
 <20191212075356-mutt-send-email-mst@kernel.org>
 <20191212131453.yocx6wckoluwofbb@steredhat>
MIME-Version: 1.0
In-Reply-To: <20191212131453.yocx6wckoluwofbb@steredhat>
X-MC-Unique: JAyQeamKOvmuzteKjAQzpQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm <kvm@vger.kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Thu, Dec 12, 2019 at 2:14 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> On Thu, Dec 12, 2019 at 07:56:26AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Dec 12, 2019 at 01:36:24PM +0100, Stefano Garzarella wrote:
> > > On Wed, Dec 11, 2019 at 11:03:07AM -0500, Michael S. Tsirkin wrote:
> > > > On Fri, Dec 06, 2019 at 03:39:12PM +0100, Stefano Garzarella wrote:
> > > > > When we receive a new packet from the guest, we check if the
> > > > > src_cid is correct, but we forgot to check the dst_cid.
> > > > >
> > > > > The host should accept only packets where dst_cid is
> > > > > equal to the host CID.
> > > > >
> > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > Stefano can you clarify the impact pls?
> > >
> > > Sure, I'm sorry I didn't do it earlier.
> > >
> > > > E.g. is this needed on stable? Etc.
> > >
> > > This is a better analysis (I hope) when there is a malformed guest
> > > that sends a packet with a wrong dst_cid:
> > > - before v5.4 we supported only one transport at runtime, so the sockets
> > >   in the host can only receive packets from guests. In this case, if
> > >   the dst_cid is wrong, maybe the only issue is that the getsockname()
> > >   returns an inconsistent address (the cid returned is the one received
> > >   from the guest)
> > >
> > > - from v5.4 we support multi-transport, so the L1 VM (e.g. L0 assigned
> > >   cid 5 to this VM) can have both Guest2Host and Host2Guest transports.
> > >   In this case, we have these possible issues:
> > >   - L2 (or L1) guest can use cid 0, 1, and 2 to reach L1 (or L0),
> > >     instead we should allow only CID_HOST (2) to reach the level below.
> > >     Note: this happens also with not malformed guest that runs Linux v5.4
> > >   - if a malformed L2 guest sends a packet with the wrong dst_cid, for example
> > >     instead of CID_HOST, it uses the cid assigned by L0 to L1 (5 in this
> > >     example), this packets can wrongly queued to a socket on L1 bound to cid 5,
> > >     that only expects connections from L0.
> >
> > Oh so a security issue?
> >
>
> It seems so, I'll try to see if I can get a real example,
> maybe I missed a few checks.

I was wrong!
Multi-transport will be released with v5.5, which will contain this patch.

Linux <= v5.4 are safe, with the exception of the potential wrong
address returned by getsockname().

In addition, trying Linux <= v5.4 (both guests and host), I found that
userspace applications can use any dst_cid to reach the host.

It is not a security issue but for sure a wrong semantics.
Maybe we should still consider to backport this patch on stables to get
the right semantics.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
