Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B72A459E
	for <lists.virtualization@lfdr.de>; Sat, 31 Aug 2019 19:43:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4BDB914B7;
	Sat, 31 Aug 2019 17:43:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5A16F14B2
	for <virtualization@lists.linux-foundation.org>;
	Sat, 31 Aug 2019 17:43:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DC97313A
	for <virtualization@lists.linux-foundation.org>;
	Sat, 31 Aug 2019 17:43:25 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A5E1C057E9A
	for <virtualization@lists.linux-foundation.org>;
	Sat, 31 Aug 2019 17:43:25 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id m2so10994921qkk.10
	for <virtualization@lists.linux-foundation.org>;
	Sat, 31 Aug 2019 10:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=cIHszIcXROJYsUB5SpC1UHCVwuIkppX7qGEFDj/5xo0=;
	b=OwmtJXp7uoGIPMWtCriVDB79gwJaDlz74VE0DuAaM/Ptx+BO5TrXh9If4rub/BtS1D
	ARwI2IpmAqJKvMDWA/CmNfIrjN9bnYjOyLS47lrjdD/RhT5eioDcOdxI+ipgFnC9aYkm
	vH0w6SsPy3oML0sIlV7bjM2vfPxUY2opO8Ah/zS9wB+q1xlNOfc93m6G13H7CjnGrRS0
	hqpj0cbyK4khzx1JB6NdaoOW3OIETgjSRP/yF3XQY4QuAayeT3AE0XcEI1y0/3A3Tw5a
	9RrXtpPxiY1rgfKi79b4cOCGlYcLz9z1u1P40xP/nwjFTLH9auHi4VsaPQxsy15PhQmt
	I3Rw==
X-Gm-Message-State: APjAAAV/jF30oK0QDxkBEg/3TYtmhmbWWNYW+hY6GXZj8hnhRK4O13jW
	qv7p4OWKx+oYegNWtmTK5F3ZSaC4Ka/mu9l9g497K37XAAEd6tHeuVB4mGVy7NmEKkK7jHWmGN7
	Omz3klx4q6LV8Jrjw26cCekmu6rpIOQitmimZVEYLNg==
X-Received: by 2002:a37:8204:: with SMTP id e4mr13824073qkd.281.1567273404563; 
	Sat, 31 Aug 2019 10:43:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUVTZQ/NdVzrtHwlgWa3CZUvMoYBF799HKr9TzniFNFWi/Tj1PilrvJQdHknPVch1OD89j7A==
X-Received: by 2002:a37:8204:: with SMTP id e4mr13824060qkd.281.1567273404418; 
	Sat, 31 Aug 2019 10:43:24 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id g19sm2433415qtb.2.2019.08.31.10.43.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 31 Aug 2019 10:43:23 -0700 (PDT)
Date: Sat, 31 Aug 2019 13:43:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH] virtio: Change typecasts in vring_init()
Message-ID: <20190831134218-mutt-send-email-mst@kernel.org>
References: <20190827152000.53920-1-matej.genci@nutanix.com>
	<20190830095928-mutt-send-email-mst@kernel.org>
	<41b8eb4b-0d3b-f103-9ec4-332a903612ee@nutanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41b8eb4b-0d3b-f103-9ec4-332a903612ee@nutanix.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Aug 30, 2019 at 05:58:23PM +0000, Matej Genci wrote:
> On 8/30/2019 3:02 PM, Michael S. Tsirkin wrote:
> > On Tue, Aug 27, 2019 at 03:20:57PM +0000, Matej Genci wrote:
> >> Compilers such as g++ 7.3 complain about assigning void* variable to
> >> a non-void* variable (like struct pointers) and pointer arithmetics
> >> on void*.
> >>
> >> Signed-off-by: Matej Genci <matej.genci@nutanix.com>
> >> ---
> >>   include/uapi/linux/virtio_ring.h | 9 +++++----
> >>   1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
> >> index 4c4e24c291a5..2c339b9e2923 100644
> >> --- a/include/uapi/linux/virtio_ring.h
> >> +++ b/include/uapi/linux/virtio_ring.h
> >> @@ -168,10 +168,11 @@ static inline void vring_init(struct vring *vr, unsigned int num, void *p,
> >>   			      unsigned long align)
> >>   {
> >>   	vr->num = num;
> >> -	vr->desc = p;
> >> -	vr->avail = p + num*sizeof(struct vring_desc);
> >> -	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
> >> -		+ align-1) & ~(align - 1));
> >> +	vr->desc = (struct vring_desc *)p;
> >> +	vr->avail = (struct vring_avail *)((uintptr_t)p
> >> +		+ num*sizeof(struct vring_desc));
> >> +	vr->used = (struct vring_used *)(((uintptr_t)&vr->avail->ring[num]
> >> +		+ sizeof(__virtio16) + align-1) & ~(align - 1));
> >>   }
> >>   
> >>   static inline unsigned vring_size(unsigned int num, unsigned long align)
> > 
> > I'm not really interested in building with g++, sorry.
> > Centainly not if it makes code less robust by forcing
> > casts where they weren't previously necessary.
> 
> Can you elaborate on how these casts make the code less robust?

If we ever change the variable types build will still pass
because of the cast.

> They aren't necessary in C but I think being explicit can improve
> readability as argued in
> https://softwareengineering.stackexchange.com/a/275714
> 
> > 
> > However, vring_init and vring_size are legacy APIs anyway,
> > so I'd be happy to add ifndefs that will allow userspace
> > simply hide these functions if it does not need them.
> > 
> 
> I feel like my patch is a harmless way of allowing this header
> to be used in C++ projects, but I'm happy to drop it in lieu of
> the guards if you feel strongly about it.
> 
> Thanks.
> Matej

Yea let's not even start.

> > 
> >> -- 
> >> 2.22.0
> >>
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
