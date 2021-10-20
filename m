Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725B4347BE
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 11:17:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C89405EC;
	Wed, 20 Oct 2021 09:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHMSzLM-um7b; Wed, 20 Oct 2021 09:17:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 345DE40432;
	Wed, 20 Oct 2021 09:17:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C73C8C000D;
	Wed, 20 Oct 2021 09:17:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69943C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 09:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57B32401AF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 09:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPlj8Z8ixK7Q
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 09:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 542AD40001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 09:17:25 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id q5so21949449pgr.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E07XCh5aoq53PcE5WzOPIBZIArSMQcyYBT49q/CHH1k=;
 b=YS1zWbCHr5Ovs6rv+B5GSVK412fvzSoZ9HXM4oHMfkIz7W0864AfgzUrlqpAAMyjUV
 u97Algm4Fx3daGwkIGCGJG5T3hYlDR5W1dHoVpiwdzLtyY5MsnssB20V0hTWr8lPZkbz
 msrd2dLRwF/35DmPJ3+6hNsAW9qiRbDMEDEvAvIOt04P6H196raVUeI+CBRErfBeucpS
 AyDqql/OL1Ud3Xs5lO5B3pfYXuzCCrilrYgVmnwlOLiKrDg8WYasljKiR3DoRY8Pq6cZ
 KwJ/fMp7qij0yc9Oe7+Zl2sT0HlX1tb5V5qyzdP0DcCB8PKfevBH+6QyiRhExQ3LWjc+
 VnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E07XCh5aoq53PcE5WzOPIBZIArSMQcyYBT49q/CHH1k=;
 b=rwJ6MbOwoggbCvHmqyv8HMrwIX9PkL7vXn9sEZZV43mLKz/0emOoXKdswhmrAOm8/Z
 EOftfAZlNvBVBaLS57Q83witJqN1/jHFmF23TYV9NayexMH662lwD89k6Rsd/OjLqWd6
 Ae5nYtn0EbN6NmbJPe8Fi133bx/X54ORbtZd9StN9QvzzQ+/dgYSxOG6rBH2WgSjv+CH
 y1/O2LGhRvyXFED6559mifaL1rvQKHGe2Wbu7VnWfkV6JB9/iRbfNrE+m3plrNhFAUCX
 3MMnTn12fCz1wNJxh/dLM1ec2nny2wI61sdGqFuIA63Oohz9QuY6K9GuWmKoWieyjogs
 JuRw==
X-Gm-Message-State: AOAM532wOyF7Osp9KcyHpv5ZgfxKMbFpAwWrf4h2xEVdy3uxHd5ia9SU
 DoNm/eLrhgTXM236CkpUy6Wzug==
X-Google-Smtp-Source: ABdhPJxcQN3jZntaqy7AG24AUDixZOEWeCrWoUCiBzdzUlJmnC63hptshpOOyZTK96lHxMPesbSj5Q==
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr5232102pfc.53.1634721444760; 
 Wed, 20 Oct 2021 02:17:24 -0700 (PDT)
Received: from localhost ([106.201.113.61])
 by smtp.gmail.com with ESMTPSA id h24sm1898381pfn.180.2021.10.20.02.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 02:17:23 -0700 (PDT)
Date: Wed, 20 Oct 2021 14:47:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Deng <jie.deng@intel.com>
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
Message-ID: <20211020091721.7kcihpevzf7h4d62@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
 <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
 <81ea2661-20f8-8836-5311-7f2ed4a1781f@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81ea2661-20f8-8836-5311-7f2ed4a1781f@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, kernel@axis.com, linux-i2c@vger.kernel.org
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

On 20-10-21, 16:54, Jie Deng wrote:
> 
> On 2021/10/19 16:22, Viresh Kumar wrote:
> > On 19-10-21, 09:46, Vincent Whitchurch wrote:
> > >   static void virtio_i2c_msg_done(struct virtqueue *vq)
> > >   {
> > > -	struct virtio_i2c *vi = vq->vdev->priv;
> > > +	struct virtio_i2c_req *req;
> > > +	unsigned int len;
> > > -	complete(&vi->completion);
> > > +	while ((req = virtqueue_get_buf(vq, &len)))
> > > +		complete(&req->completion);
> > Instead of adding a completion for each request and using only the
> > last one, maybe we can do this instead here:
> > 
> > 	while ((req = virtqueue_get_buf(vq, &len))) {
> >                  if (req->out_hdr.flags == cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT))
> 
> 
> Is this for the last one check ? For the last one, this bit should be
> cleared, right ?

Oops, you are right. This should be `!=` instead. Thanks.

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
