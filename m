Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF916BD02
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 10:07:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1805420555;
	Tue, 25 Feb 2020 09:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSQkNznOtHIj; Tue, 25 Feb 2020 09:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 94A4C20656;
	Tue, 25 Feb 2020 09:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73787C0177;
	Tue, 25 Feb 2020 09:07:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DADF9C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C585B86909
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LywBeSVbK416
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13691868DE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582621658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J9KNb3WVdOxwxKr6MYNPKvXY1jE7XXYkemzIOMy9lrE=;
 b=i2N+4Su/asOd1EGLWDVkJZvykjCeF7n5a3eSO4MEYuiB5k7M13QU9IVM0YtyYW+pjC7BzW
 AwPnrYNj3YLy49aSxPMqEvFzh6Y/o+CZltJPbDvOQvPbp/wTLZuBQ/PUjqh/s7hSARq0S/
 HuhcpotQJQh4sMHbZ2eQtWMZDNPOaoU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-6gYpMc06On-FvFnG9mhOAg-1; Tue, 25 Feb 2020 04:07:37 -0500
X-MC-Unique: 6gYpMc06On-FvFnG9mhOAg-1
Received: by mail-wr1-f71.google.com with SMTP id 90so6986702wrq.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 01:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J9KNb3WVdOxwxKr6MYNPKvXY1jE7XXYkemzIOMy9lrE=;
 b=dWRvdYJI2rF/zA1pDrPuNWENUQC1zVVvQCgAr2Nvdst/vTAY1siRQXd4WiFUHcEusW
 Qf1Bf1orK+ze4Q8wPxY3PMuTjVzOCjoVMGgdUbNvyYdyLDk1POEObCkoGdJS2KPiZUn8
 eQxAiYM8VWs7/VL5qidQWe4BZXMO30ad3EYPEhnW7driR2RtxQ6OoX8UVyaWFo54q+QF
 OdIr+99G5v+Hf1jhBQvGW2HIIIIbRKJcEmbV8s8EfHM9AZE0qscktVE2i2A8viyeEbFr
 yxAEGWn8Rtd2elDTbkLGwPWSh5+BJg41OU18Jt6+limM5fzs6INbecm6tzoHUe4ye87z
 YFPw==
X-Gm-Message-State: APjAAAX1BsGB/YicbbkrG3AhFhYRrVXpDWexNSZVGVV4qtxT5nN924QE
 b+OppRXx28Uajf2Y3yrxsey00lcZtDNN1lS+Fr04II4It3Y60w81JAwOa+EoiFK64T4cHUUaHeG
 V9v+Bkh05w1OV/cPh3qvZ2B2uWUeYCu5P2cAMAJCghQ==
X-Received: by 2002:a5d:504e:: with SMTP id h14mr13354444wrt.82.1582621655917; 
 Tue, 25 Feb 2020 01:07:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvXTw1dY0/iQ7fl5rVkhMh/4ortONYEYN8tZpl8lKh5OB5cJe57Upw2uu6Y8P8dd7G6t5LXg==
X-Received: by 2002:a5d:504e:: with SMTP id h14mr13354415wrt.82.1582621655699; 
 Tue, 25 Feb 2020 01:07:35 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id s1sm22666564wro.66.2020.02.25.01.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 01:07:35 -0800 (PST)
Date: Tue, 25 Feb 2020 10:07:32 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: INFO: task hung in lock_sock_nested (2)
Message-ID: <20200225090732.kge6bdf46ji6mbb5@steredhat>
References: <0000000000004241ff059f2eb8a4@google.com>
 <20200223075025.9068-1-hdanton@sina.com>
 <20200224134428.12256-1-hdanton@sina.com>
MIME-Version: 1.0
In-Reply-To: <20200224134428.12256-1-hdanton@sina.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org,
 syzbot <syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 syzkaller-bugs@googlegroups.com, Stefan Hajnoczi <stefanha@redhat.com>,
 kuba@kernel.org, davem@davemloft.net, Jorgen Hansen <jhansen@vmware.com>
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

On Mon, Feb 24, 2020 at 09:44:28PM +0800, Hillf Danton wrote:
> 
> On Mon, 24 Feb 2020 11:08:53 +0100 Stefano Garzarella wrote:
> > On Sun, Feb 23, 2020 at 03:50:25PM +0800, Hillf Danton wrote:
> > > 
> > > Seems like vsock needs a word to track lock owner in an attempt to
> > > avoid trying to lock sock while the current is the lock owner.
> > 
> > Thanks for this possible solution.
> > What about using sock_owned_by_user()?
> > 
> No chance for vsock_locked() if it works.
> 
> > We should fix also hyperv_transport, because it could suffer from the same
> > problem.
> > 
> You're right. My diff is at most for introducing vsk's lock owner.

Sure, thanks for this!

> 
> > At this point, it might be better to call vsk->transport->release(vsk)
> > always with the lock taken and remove it in the transports as in the
> > following patch.
> > 
> > What do you think?
> > 
> Yes and ... please take a look at the output of grep
> 
> 	grep -n lock_sock linux/net/vmw_vsock/af_vsock.c
> 
> as it drove me mad.

:-) I'll go in this direction and I'll check all the cases.

We should avoid to take lock_sock in the transports when it is possible.

Thanks for the help,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
