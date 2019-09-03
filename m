Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DFA6C11
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 17:00:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ABB29D0A;
	Tue,  3 Sep 2019 15:00:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 30E61D0A
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 15:00:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F3AFB831
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 15:00:37 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1938B2A09AE
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 15:00:37 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id c187so4961707qkf.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 08:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KXBcRiCzE5toFQPvirypSePgXTAp9EkT2QplSpuPdPg=;
	b=AscqHoFelkDLLhiqGm2JhqQTBF4KsuAAT67VRDSrrRV+SMt8jAuZL11ZUJ96GaeKo7
	Wuo8A99Yxi3f+7J50qyGm9M/NALGu+3orROaUrM/e0gAP6E3Pd32tkjRNIczVosNLDZF
	BnYcGT1LNuwuGQBXcObgrGBxxMZNNmTC4tjSha5poEbP1Pv5JAubf10LW0CKWjYCxv2n
	JBccjHOJDRU8vEIVnAHLpLjPrQoPH+ohgX4ZnyLK5UXTHUVz8Lds2gD3lPxi0UwXbSqa
	s0RSK7+spe9GX2tM5vRW5GMzVtEicXVkbO8CBPkqxtaKuBXB8TEYAvzBb2/7z+7zlAiW
	B8JQ==
X-Gm-Message-State: APjAAAWqrowerWP53MLDLcjjodfIfOQxV3PZh06ZgznefXjm3a+wzhLq
	hPDcHRUVCvuW+/wzjSMrJCqfnyiiWXjpIzczolm0i/gEtvJxlPpDvwPpljEd+riLthjHz45ehc/
	QWnKlPJ96whStn4/8KZ8XEb4gLcn3F63yzASQ6gr83A==
X-Received: by 2002:a37:470a:: with SMTP id u10mr5544451qka.17.1567522836438; 
	Tue, 03 Sep 2019 08:00:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwX7TspzFyxuwob+EMNdf8BABzLUIs6GRYTTNyphxRKypQ3g5QNYvArrCH/9RyhQNDnFU1d+Q==
X-Received: by 2002:a37:470a:: with SMTP id u10mr5544426qka.17.1567522836228; 
	Tue, 03 Sep 2019 08:00:36 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	p186sm8738374qkc.65.2019.09.03.08.00.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 08:00:35 -0700 (PDT)
Date: Tue, 3 Sep 2019 11:00:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH] virtio: Change typecasts in vring_init()
Message-ID: <20190903105954-mutt-send-email-mst@kernel.org>
References: <20190827152000.53920-1-matej.genci@nutanix.com>
	<20190830095928-mutt-send-email-mst@kernel.org>
	<41b8eb4b-0d3b-f103-9ec4-332a903612ee@nutanix.com>
	<20190831134218-mutt-send-email-mst@kernel.org>
	<6454e12b-470b-cce6-5570-3fb92cbc916d@nutanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6454e12b-470b-cce6-5570-3fb92cbc916d@nutanix.com>
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

On Mon, Sep 02, 2019 at 09:56:42AM +0000, Matej Genci wrote:
> On 8/31/2019 6:43 PM, Michael S. Tsirkin wrote:
> > On Fri, Aug 30, 2019 at 05:58:23PM +0000, Matej Genci wrote:
> >> On 8/30/2019 3:02 PM, Michael S. Tsirkin wrote:
> >>> On Tue, Aug 27, 2019 at 03:20:57PM +0000, Matej Genci wrote:
> >>>> Compilers such as g++ 7.3 complain about assigning void* variable to
> >>>> a non-void* variable (like struct pointers) and pointer arithmetics
> >>>> on void*.
> >>>>
> >>>> Signed-off-by: Matej Genci <matej.genci@nutanix.com>
> >>>> ---
> >>>>    include/uapi/linux/virtio_ring.h | 9 +++++----
> >>>>    1 file changed, 5 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
> >>>> index 4c4e24c291a5..2c339b9e2923 100644
> >>>> --- a/include/uapi/linux/virtio_ring.h
> >>>> +++ b/include/uapi/linux/virtio_ring.h
> >>>> @@ -168,10 +168,11 @@ static inline void vring_init(struct vring *vr, unsigned int num, void *p,
> >>>>    			      unsigned long align)
> >>>>    {
> >>>>    	vr->num = num;
> >>>> -	vr->desc = p;
> >>>> -	vr->avail = p + num*sizeof(struct vring_desc);
> >>>> -	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
> >>>> -		+ align-1) & ~(align - 1));
> >>>> +	vr->desc = (struct vring_desc *)p;
> >>>> +	vr->avail = (struct vring_avail *)((uintptr_t)p
> >>>> +		+ num*sizeof(struct vring_desc));
> >>>> +	vr->used = (struct vring_used *)(((uintptr_t)&vr->avail->ring[num]
> >>>> +		+ sizeof(__virtio16) + align-1) & ~(align - 1));
> >>>>    }
> >>>>    
> >>>>    static inline unsigned vring_size(unsigned int num, unsigned long align)
> >>>
> >>> I'm not really interested in building with g++, sorry.
> >>> Centainly not if it makes code less robust by forcing
> >>> casts where they weren't previously necessary.
> >>
> >> Can you elaborate on how these casts make the code less robust?
> > 
> > If we ever change the variable types build will still pass
> > because of the cast.
> > 
> 
> Wouldn't that be the case in the original as well?
> You're assigning void*, which is implicitly cast to everything.


Right. And if we change that void * to something else,
build will fail. Not so with a cast.

> >> They aren't necessary in C but I think being explicit can improve
> >> readability as argued in
> >> https://urldefense.proofpoint.com/v2/url?u=https-3A__softwareengineering.stackexchange.com_a_275714&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=dbPDDn52JgZndd-WPvGcL5PLZTrms-72TItYJx-If5I&m=sw6xxC2EOF9g3XtUKuI6OvT5xhYF7XcWBqyQvGb-UMw&s=QWoZHF4XlOzPesnnbfsf1_KORrzkXb6yfd6yQGCwepc&e=
> >>
> >>>
> >>> However, vring_init and vring_size are legacy APIs anyway,
> >>> so I'd be happy to add ifndefs that will allow userspace
> >>> simply hide these functions if it does not need them.
> >>>
> >>
> >> I feel like my patch is a harmless way of allowing this header
> >> to be used in C++ projects, but I'm happy to drop it in lieu of
> >> the guards if you feel strongly about it.
> >>
> >> Thanks.
> >> Matej
> > 
> > Yea let's not even start.
> > 
> 
> Sure. I can re-send the patch with guards. But for my own sake,
> can you elaborate on the above?
> 
> >>>
> >>>> -- 
> >>>> 2.22.0
> >>>>
> >>
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
