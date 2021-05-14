Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492C38044C
	for <lists.virtualization@lfdr.de>; Fri, 14 May 2021 09:31:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E8683BD3;
	Fri, 14 May 2021 07:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vywfN4tke172; Fri, 14 May 2021 07:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC4C84320;
	Fri, 14 May 2021 07:31:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB4A6C0001;
	Fri, 14 May 2021 07:31:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D26C5C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 May 2021 07:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B329F4012E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 May 2021 07:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gPQRPJ8L4_p
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 May 2021 07:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 618564012A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 May 2021 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620977478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEwXortYNaxldB+sCYne8sqnUUpZSsLp70/SckpgE3s=;
 b=ZovNeuN2+SW2CTNZBpGQW07JXcA20pL8MPr7wUog1SJEctJGpYZmFP/IgOoWj33swUqlAe
 uICChviAlUV6BD+30qa6bz5/41VUI8VnsRFlbKxPN6qyIBJTPQgwDIv9X+vcJ2burR9TqD
 scroES6C8rqirWJJ5MiGCopadTFF+Gk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-Bg1kVq0OO5WSWu86HFp2yw-1; Fri, 14 May 2021 03:31:16 -0400
X-MC-Unique: Bg1kVq0OO5WSWu86HFp2yw-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk30-20020a170906d9deb02903916754e1b6so9264350ejb.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 May 2021 00:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEwXortYNaxldB+sCYne8sqnUUpZSsLp70/SckpgE3s=;
 b=W749h32PRCdowosoXGGViIj7aamLAhzO+ie4R12Jx26jxq3ThFl7wb0dS+M3qhAL8B
 Id+8MzqFFIMNuAxHNTcO/LbUGH2P1S3YtmyM2VlEOe2uT2NVUAjZxrD05tWdKgxeck4c
 w/eqSJbqu4sBSoAp6Pe6fVCjuggRTin/mkaaoWO7dXX/IcLki4n+nQCdZ/c0MYN6jGrS
 wG7OGDj3I9S1h1YwIuc09q/AmIhyjRu1cAYaiALhWGgv63dfF+4xUECjUH3j+KVYsj98
 blTMEQK4uPvxQD8ceevFdtfj6vvPv11Q2uaQxqSmyWkJsJMEFORE4BQeu+iTiT8R7eWl
 eUnQ==
X-Gm-Message-State: AOAM532EKc5W10ysaKn4xDhkQ0j5Q1M6aD4bvxPUqt2o3PBuT2wywxvd
 aFYZ68q6Vn+Lo3zX0XdKSm/Z2wyAYEGm+WGHmXsJZiE32nHWuikjMzMvrcBVg0v+ucNBTbxT6o4
 sP9mkJHvvYsIiL8Eha47JdwOHWuGA+NmUvj7f3a3NBFKlgz+LtNlXwyBymQ==
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr10881544edu.160.1620977474536; 
 Fri, 14 May 2021 00:31:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG8avBVDLQcb88RwIjGEcI7lLXFcOmFPlv7+LK8Qxs01/mzkmQtnLTZTqGoCS/1yMev77rExPJWWaCKvsQL7A=
X-Received: by 2002:a2e:9c91:: with SMTP id x17mr24353676lji.385.1620977463809; 
 Fri, 14 May 2021 00:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210423080942.2997-1-jasowang@redhat.com>
 <YJ1TgoFSwOkQrC+1@stefanha-x1.localdomain>
 <CACycT3v-2naEaXEtPqaKcGz8qpfnmp4VzrHefqLNhO=9=57jdQ@mail.gmail.com>
In-Reply-To: <CACycT3v-2naEaXEtPqaKcGz8qpfnmp4VzrHefqLNhO=9=57jdQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 May 2021 15:30:52 +0800
Message-ID: <CACGkMEvKByPZFwN8bU6_SfRbS9i43am7X5WGJQtE=Yh+YKWOHw@mail.gmail.com>
Subject: Re: Re: [RFC PATCH V2 0/7] Do not read from descripto ring
To: Yongji Xie <xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: ashish.kalra@amd.com, file@sect.tu-berlin.de, kvm <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, konrad.wilk@oracle.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Stefan Hajnoczi <stefanha@redhat.com>
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

On Fri, May 14, 2021 at 2:07 PM Yongji Xie <xieyongji@bytedance.com> wrote:
>
> On Fri, May 14, 2021 at 12:27 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Fri, Apr 23, 2021 at 04:09:35PM +0800, Jason Wang wrote:
> > > Sometimes, the driver doesn't trust the device. This is usually
> > > happens for the encrtpyed VM or VDUSE[1].
> >
> > Thanks for doing this.
> >
> > Can you describe the overall memory safety model that virtio drivers
> > must follow? For example:
> >
> > - Driver-to-device buffers must be on dedicated pages to avoid
> >   information leaks.
> >
> > - Driver-to-device buffers must be on dedicated pages to avoid memory
> >   corruption.
> >
> > When I say "pages" I guess it's the IOMMU page size that matters?
> >
> > What is the memory access granularity of VDUSE?
> >
>
> Now we use PAGE_SIZE as the access granularity. I think it should be
> safe to access the Driver-to-device buffers in VDUSE case because we
> also use bounce-buffering mechanism like swiotlb does.
>
> Thanks,
> Yongji
>

Yes, while at this, I wonder it's possible the re-use the swiotlb
codes for VDUSE, or having some common library for this. Otherwise
there would be duplicated codes (bugs).

Thanks

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
