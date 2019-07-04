Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA5D5F931
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 15:33:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 360EB1164;
	Thu,  4 Jul 2019 13:33:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EB24BA7F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 13:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9351070D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 13:33:19 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id u124so1957050vsu.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 04 Jul 2019 06:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oQVVIWl//6cOx7PlPgCwTmODIiDI0iixaOn3E5xX89k=;
	b=tf6GWRf+C/ZB5a/aNf2dgNIGQoefiebM+pWSkWYd6g5+42Vw8BY/Hflfy5rgyEqBIY
	AkjG1Lt06tXP0NTdnFXu5ozD0KVkkrgkobAiW0vi8cmliCBscS6yh3+rxtN0U4p6uJ1z
	aVGTXdw3d22F94J0hDEqd2hbwmDI8dNRta+U40O/xSj2f4N45oZNN1B7UxmNU3DCVt1L
	ifcQG3k+n8CZpalpAnKd4AWSexGUm5ZQI7LujqCoWgxTB1SArwstn8/mpG9coVpqX89g
	hgEkx/ETJi9fEYCLRKBtXjcBZbCUhY4ioUU7UcJQHHhhKqifAkrjSzFIjCDZ77D4IX4B
	Tfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oQVVIWl//6cOx7PlPgCwTmODIiDI0iixaOn3E5xX89k=;
	b=G9goY2eDP80z6I4i0S0BDLUIYrg6VoQktmQnM2cJ2HjYcmVsySEl+kyV3gLBw0R/dV
	krDaXpilBm/8hJ5xqheXZz5/nspr0gC+Gw/75XcVW/LP4P86B37Ml3f3kCACxehsutAt
	CAEIM84zqBAXchCuoEdZxis+ec3XiNzkYEpJ9Ybd9YNoaHztB7i/ezzpeqPOWDs8YQIw
	7QTw0tvPuCvLWH89jcwQQQPQ5ygZjeDWRYTLMtk52RES0ucbZLD0gxSbi3EfaAFW8s6I
	8S7ERHwSwGOClKp18PdCSIF+2nqRYaIJ+DFQ+Q3r3gJsmjMiKhs7S3YC7/NzEj2dOajG
	V7eg==
X-Gm-Message-State: APjAAAUCU5SOdl7LABIfyIqgGfQq3S1ItoYFIbQMQfsaXiHs1bD8Bv3b
	c3Q5OsnBC7Rs75G/HFb1u5vZpaaE/5Yq4vii5MQ=
X-Google-Smtp-Source: APXvYqzNxMrL7Y1CtJokOFwqwShcUzdoU0/yTDHqrQLqguDdVULNGiPTFyjwU9y4H4PtuVAxlBXZEwnPTTITZkfD8P4=
X-Received: by 2002:a67:eb87:: with SMTP id e7mr22016486vso.118.1562247198710; 
	Thu, 04 Jul 2019 06:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-12-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-12-kraxel@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 14:33:26 +0100
Message-ID: <CACvgo53tSNa9=3LvmEdZvSp8g4oQF=cuue4UyTMjBtSKsfR0Ew@mail.gmail.com>
Subject: Re: [PATCH v6 11/18] drm/virtio: switch from ttm to gem shmem helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Tue, 2 Jul 2019 at 15:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
>         .gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,

I think that you can drop this entry-point. AFAICT it's only purpose
is to return an error - something already handled by core DRM when the
function pointer is NULL.
It's not strictly related to this series, so feel free to keep is a
separate standalone patch.

-Emil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
