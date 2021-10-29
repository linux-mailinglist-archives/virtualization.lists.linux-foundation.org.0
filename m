Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C607C43F4FF
	for <lists.virtualization@lfdr.de>; Fri, 29 Oct 2021 04:34:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9849B81A24;
	Fri, 29 Oct 2021 02:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xF3Kea8PTuGC; Fri, 29 Oct 2021 02:34:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 78ADC81B58;
	Fri, 29 Oct 2021 02:34:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3C12C000E;
	Fri, 29 Oct 2021 02:34:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF2C4C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Oct 2021 02:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D745481A3B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Oct 2021 02:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byl-JHgcF8RC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Oct 2021 02:34:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E365D81A24
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Oct 2021 02:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635474854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x+7BUHLUn6ZyfYSn3n4XhTP9u1Fuj5DcugTIl+hX/rA=;
 b=RYbnSA+nw9JywIJgIRC0sVF1MaKjSRNInrR+wHiEJ8KgzMy8LHHbN+uF+IS8OEkmY7/WX/
 ugAE7HXVO8NV9LlFgIEwGnYkJqyCGVV8BNwFEqwENGTmwhbySXoUZt6dHuva+tQ97IlJkj
 2HRchuvKPKzjkRl5eAYBlThzsU/1IyI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-fvk7TnqeP5Kfp2RfwQtTPg-1; Thu, 28 Oct 2021 22:34:13 -0400
X-MC-Unique: fvk7TnqeP5Kfp2RfwQtTPg-1
Received: by mail-lf1-f71.google.com with SMTP id
 bq29-20020a056512151d00b003ffce2467adso3627587lfb.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 19:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x+7BUHLUn6ZyfYSn3n4XhTP9u1Fuj5DcugTIl+hX/rA=;
 b=QfyqI7nzqY42LnvHdjhYE1QDsRqy3is+oQnykBi5f2OiDQyzbfwLVozLNep6bBxYQ6
 Amx3j1dKDljla8nLvjo1fhGWf80PlPZkzopcLfqntlzQ5Pf/wfBmI53fTayae/hpmBgx
 nNY+fEEeAQUH4NilRIJ1tDjDftNpFMGfU8WOoLK7SWTtAeECkyjWC4fmsOEKv+DEwGBy
 68EKw/qicu4Sm16trUo2uNpKhibtJBCP7nNlqfVJ3//bUpLDboIxzLhu0D9vyeORA8gf
 +y6Kj484NYV8DMcGxFHIM+fDN06wENfF4NL/dIlPM6azgX2SAZqiBn8udJ1EX2iwat73
 ZgRw==
X-Gm-Message-State: AOAM533z18KexIE7SY99BgD4pWWzlyj4c/LSnznQzBkR+1D1TtGxHJhw
 kYLx+81S2yhA3Wpdt98VyUHmBsUZiJH8UpZC0Pk3VEPQsy45dtNKTI9aPVdop3BhMtxxk8wC7+0
 zDmgsWmzjOYYcNq1ZDoZnN5tLwILY90iZeR9/txB/Eiazo0i4R+NfcfThPw==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr8718751ljg.217.1635474851557; 
 Thu, 28 Oct 2021 19:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOwNKpGIwK1vNPqhbq2Zh933hI99qWvf+yWw+Kv2UtWSJ6r6ynt0QXRjnjO68kjeIK8oOInMe/cBuBqUBzsxY=
X-Received: by 2002:a2e:9155:: with SMTP id q21mr8718730ljg.217.1635474851338; 
 Thu, 28 Oct 2021 19:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F7r7=P8E-f1Nnm2h18S-hL8YBt7s=J81fkQcrAdpZ-KwQ@mail.gmail.com>
 <PH0PR12MB548115FD6354339B41A11CE3DC859@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20211027154728.qkrtl6jtfoqlbwfu@steredhat>
 <PH0PR12MB548104D8BE92D2C5DC49A7A4DC859@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20211028093740.jv7gfqrgrmq7elje@steredhat>
 <PH0PR12MB54813F6CFDF8A1E1F7AE68B8DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54813F6CFDF8A1E1F7AE68B8DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 29 Oct 2021 10:34:00 +0800
Message-ID: <CACGkMEt+iwKc=O552rsMUWdmT1MGVpUJrKsjdjv7mv=4uX1uOQ@mail.gmail.com>
Subject: Re: vDPA bus driver selection
To: Parav Pandit <parav@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Eli Cohen <elic@nvidia.com>, Michael Tsirkin <mst@redhat.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
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

On Thu, Oct 28, 2021 at 5:48 PM Parav Pandit <parav@nvidia.com> wrote:
>
>
>
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > Sent: Thursday, October 28, 2021 3:08 PM
>
> > >> >$ vdpa/vdpa dev add mgmtdev vdpasim_net name vdpa0 mac
> > >> >00:11:22:33:44:55 $ echo 0 > /sys/bus/vdpa/drivers_autoprobe
> > >> >
> > >> >And after vdpa device creation, it manually binds to the desired
> > >> >driver such as,
> > >> >
> > >> >$ echo vdpa0 > /sys/bus/vdpa/drivers/virtio_vdpa/bind
> > >> >Or
> > >> >$ echo vdpa0 > /sys/bus/vdpa/drivers/vhost_vdpa/bind
> > >>
> > >> Cool, I didn't know that. This is very useful, but do you think it
> > >> might be better to integrate it with the netlink API and specify at
> > >> creation which bus driver to use?
> > >I think it is useful; for vduse case we need the ability to say "none"
> > >as well and when nothing specified it should be default driver.
> >
> > Yep, the default can be the actual behaviour.
> >
> > >
> > >More than netlink, I think we need the ability in the core kernel to
> > >make this choice.
> >
> > Okay, but I think we can include that in the vdpa tool.
> If functionality and interface exists in other part of the it is hard to wrap that in vdpa tool that does the duplicate work.
>
> >
> > >I haven't explored what is already available to make that happen.
> >
> > Me too, I only saw the .match() callback of "struct bus_type" that could be used
> > for this purpose.
> >
> > >If/once its available, I am sure it has more users than just vdpa.
> >
> > Make sense. I'll spend some time next week.
>
> Ok. yeah, may be a desired driver can be stored in the vdpa_device that match() routine can use.
> And if that driver is not available,  it returns EPROBE_DEFER; so whenever such driver is loaded it can be bind.
>
> But I think before wrapping something in vdpa, need to find a reason why the current interface doesn't solve the problem and also to figure out plumbing.

I agree. If it's something that can easily be addressed by the
management code (just a matter of the extra steps for manual setup).
It's probably not worth bothering.

Thanks

>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
