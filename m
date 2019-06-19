Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A92A4B65C
	for <lists.virtualization@lfdr.de>; Wed, 19 Jun 2019 12:42:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A4FE4F32;
	Wed, 19 Jun 2019 10:42:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 29BE7F2A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 10:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B95E6E6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 10:42:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so1188050wmj.5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TT2nK9A47FLcAVPWjohBdM0YSA12JZIvgdjlygMunHY=;
	b=NyIsIIb+uVSx90RcZzFhDtYTjpvPlbj+hShSLfVTuJIpwMvZ/ktBguPb0h4gANFzoi
	hvLO9eK3+HcdDVGQqD4g6tfj30LVmL361dA7To7DiQGi0nM1Zm1pvX7plq+6FOH7NmAr
	/O+kiyQUl0JxHCQQcIUjmJvlZIDtqcyTcqHWD7j+mEn55FSdIUa+BgKm50iEvucQFs6s
	enAOJmxl4UVjU7zLox6+cqbLZeNCNPM24D74OHDh2chnsVpkFDOlc4Nn8zllc0AlalEC
	VdJcgCpHGQZ2WOKypxHA5wiou0C8wvRHblDGY4Y9c8KsQ+vcp7r5s5pobRcx7rLVlV03
	1hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TT2nK9A47FLcAVPWjohBdM0YSA12JZIvgdjlygMunHY=;
	b=BK5YrxujmlUW5JkI43yzJ2Ioccp1UYBbDvyQud72o+54TwePZ9EE8PcC/ZZ4xQ6boN
	rLkrweA0OTf/nnxSgRcWWvDTu3SjU/VXAN304LevMP13zjEweOOV/dmPferCTbl8MZsh
	j67DTu1q3qe6nnGGjJ48RG2NWhPkHJs5OXiz0oivQMMB8hkv3apXP+zO2x/GGZMu21Hn
	Re2r9kuei+Amq96lLmdQDUHzylFUoNa3jt9DeUjc6yzNbrnwfGqGeNnoK0gKnRg57rJW
	IVqwhQW35C2+cFOgDXAdKqdKG+a9++nRnKQLYFzOrgrLSwm2+HDZEK0ptpKB9USI+Bhu
	2GZA==
X-Gm-Message-State: APjAAAVc7RthSA/xm0av6rwd4AaHLXhLtzek8bcMFKfz9hW+a/pKvgrm
	rNwB7en9nYfs7GCiBBIQfHA=
X-Google-Smtp-Source: APXvYqwZTMniWreXGV97t4naAESnNM/rCdLIobReK3BHsdELYGgUuiUhiov95Ols8kq0IrJru4hIaQ==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr8069991wmc.62.1560940939330;
	Wed, 19 Jun 2019 03:42:19 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
	by smtp.gmail.com with ESMTPSA id
	w2sm16821493wrr.31.2019.06.19.03.42.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 03:42:18 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:40:14 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 11/12] drm/virtio: switch from ttm to gem shmem helpers
Message-ID: <20190619104014.GB1896@arch-x1c3>
References: <20190619090420.6667-1-kraxel@redhat.com>
	<20190619090420.6667-12-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-12-kraxel@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, "open list:VIRTIO GPU DRIVER"
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

Hi Gerd,

On 2019/06/19, Gerd Hoffmann wrote:

> -static void virtio_gpu_init_ttm_placement(struct virtio_gpu_object *vgbo)
> +static const struct drm_gem_object_funcs v3d_gem_funcs = {
s/v3d/virtio/g

Doubt I'll have the time for a proper review - just this and the 1/12 nits :-\

HTH
Emil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
