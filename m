Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 70259757009
	for <lists.virtualization@lfdr.de>; Tue, 18 Jul 2023 00:52:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E3DA40A91;
	Mon, 17 Jul 2023 22:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E3DA40A91
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WSU35uqK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmjTEXn1SX6O; Mon, 17 Jul 2023 22:52:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 127E840908;
	Mon, 17 Jul 2023 22:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127E840908
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43C97C0DD4;
	Mon, 17 Jul 2023 22:52:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2984C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jul 2023 22:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B17BC40863
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jul 2023 22:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17BC40863
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WSU35uqK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elR_t3F2IYBu
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jul 2023 22:52:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5BB40861
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E5BB40861
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jul 2023 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689634329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wy84DSSq8n2YYiK0mWellsvoswCFp/2kMAmdZ+UHHc=;
 b=WSU35uqKWX5qXsL9Eqi4qqS9SCAvtRdUoP1pqlX2O/1cZK2gLwhVZqB5eExNH9bGJCaIvz
 BDObKB9Pjgy9nnNWI0Mg64rgQFu1m48ni/wL21sFRtdMbxZw6ZsGTbH7RccOeY6fV1KDLB
 hn5FNoggx6POG5Pi2hj0zNHisqxMXTQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-Xu2evVDSPn63GzDEi_D4oQ-1; Mon, 17 Jul 2023 18:52:07 -0400
X-MC-Unique: Xu2evVDSPn63GzDEi_D4oQ-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-786fa88a6f0so317984539f.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jul 2023 15:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689634327; x=1692226327;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8wy84DSSq8n2YYiK0mWellsvoswCFp/2kMAmdZ+UHHc=;
 b=YGancGnbNVZ0IMSO+VFEiZ+8nBrJ6pNCLcjk67+ieCDxxwjUxFCMwrGfNT8QwfPQx4
 ecyQv3ykh36inJhQNU6DFYkfVUmduDUru/p1lMkuhQSfKwapJzGwVj2k5oyasCouDmy6
 JJoxD2S9QgEM6YP0Cfm85OGiE5OZHS8BO4oqo8YOPDTQe1/eGR6vSTSCnTFrpVe2vBDb
 PbiM2XulE2Si8UZqHH6L+yrYXoUYLXt234PVnyJ+bJ19OlNey5Ld+qswB5SNFemrsrJ2
 xFrNHG003uLMVkgpUu1UjT/g07MM5HeVH6gvRe3QvLUQ8ZXkvY3oM245euvxWo+osZHj
 tA7g==
X-Gm-Message-State: ABy/qLbDmUCSZJFzeqY5nG94fXK4Zu7vlnjXkRKqK4liw/hxpRZQ5Mth
 e33doUWaBvwTEqR/ffK4xOObmqVV5GE+5xWer/9N3X5SGLOm/RsVgWDoToPZyYEQYdbfh142qss
 wZa3OdfiMe/l4VzEHCsH9kp5KdlusahWzO9P/aMH9Gw==
X-Received: by 2002:a92:c651:0:b0:347:693a:7300 with SMTP id
 17-20020a92c651000000b00347693a7300mr1012069ill.26.1689634327051; 
 Mon, 17 Jul 2023 15:52:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGlBYmCdY1EaUds5QDcX7E6PqePOm9wJTOwk2wgOBkeJp+9wxIVvWJlHjSTuTXhWw/m+atXtQ==
X-Received: by 2002:a92:c651:0:b0:347:693a:7300 with SMTP id
 17-20020a92c651000000b00347693a7300mr1012015ill.26.1689634326829; 
 Mon, 17 Jul 2023 15:52:06 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d10-20020a92ddca000000b00341c0710169sm242627ilr.46.2023.07.17.15.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 15:52:06 -0700 (PDT)
Date: Mon, 17 Jul 2023 16:52:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <20230717165203.4ee6b1e6.alex.williamson@redhat.com>
In-Reply-To: <ZLW8wEzkhBxd0O0L@ziepe.ca>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
 <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
 <20230717130831.0f18381a.alex.williamson@redhat.com>
 <ZLW8wEzkhBxd0O0L@ziepe.ca>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 netdev@vger.kernel.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marcin Wojtas <mw@semihalf.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, x86@kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Xu Yilun <yilun.xu@intel.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Dominik Behr <dbehr@chromium.org>,
 intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shakeel Butt <shakeelb@google.com>, kvm@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, Grzegorz Jaszczyk <jaz@semihalf.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Pavel Begunkov <asml.silence@gmail.com>
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

On Mon, 17 Jul 2023 19:12:16 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Mon, Jul 17, 2023 at 01:08:31PM -0600, Alex Williamson wrote:
> 
> > What would that mechanism be?  We've been iterating on getting the
> > serialization and buffering correct, but I don't know of another means
> > that combines the notification with a value, so we'd likely end up with
> > an eventfd only for notification and a separate ring buffer for
> > notification values.  
> 
> All FDs do this. You just have to make a FD with custom
> file_operations that does what this wants. The uAPI shouldn't be able
> to tell if the FD is backing it with an eventfd or otherwise. Have the
> kernel return the FD instead of accepting it. Follow the basic design
> of eg mlx5vf_save_fops

Sure, userspace could poll on any fd and read a value from it, but at
that point we're essentially duplicating a lot of what eventfd provides
for a minor(?) semantic difference over how the counter value is
interpreted.  Using an actual eventfd allows the ACPI notification to
work as just another interrupt index within the existing vfio IRQ uAPI.
Thanks,

Alex

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
