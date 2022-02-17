Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE784B9612
	for <lists.virtualization@lfdr.de>; Thu, 17 Feb 2022 03:48:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F0A40928;
	Thu, 17 Feb 2022 02:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xc8-JvdZh0TD; Thu, 17 Feb 2022 02:48:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 70E17408CA;
	Thu, 17 Feb 2022 02:48:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB216C0073;
	Thu, 17 Feb 2022 02:48:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B828AC0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 02:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9261F40891
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 02:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hq2-_QgD1NXl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 02:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7952C4087B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 02:48:12 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y5so3790737pfe.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Feb 2022 18:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=z4i3sOJXuX5pLimLJFSpC+ldhVIHQTJAyQCIIZg6vB0=;
 b=MAKfpeBarFVBWwQcysBwZiWFmuKrF2I+yyKafwWHcLfuPTLpj5AhAFFMGSOS1ptpVW
 BYaxp5/QaxDBE1pbWlzrWulYvblHF3P7HnUm40geVqEe/CWtocilVYmWtBMQzvgh7gBP
 SbAi45TriQv1LDZ2FyoWNZKj3/g8YKlnllG9oTlhCX6attCGW/oTE70mpGrFw+Mm37eD
 LqBsarqyBz7pJPWcP7lS0PVSDwRX7c2kZZjb0yAi580ERYzK4vlWMpLyB6+sBS9G1+2S
 R+di0YkeuwdBoSGR3bQktJMmbNdIuykrRs4AADH7x+Gtr0RqPEq4USsFnolA7nsMWr9W
 XLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=z4i3sOJXuX5pLimLJFSpC+ldhVIHQTJAyQCIIZg6vB0=;
 b=GyZzskkD90cLW7SSGWFoQ2l4a//kXdDgjF0RKS460Ygsma5AJ20YgBW5uVRcpV3uHv
 TO5JHzuVjRhkM7NzF9b1vvxLF2T5FgzLao7Xj6ERYYqB4W+JEY8Bs1sYJCXw6vLeDq+O
 wob0zraVXwmIV+aqHCstM669Oyk3jjvlj8FRj6oXFsFKerkguXorFDEVmAhcwh8P55gb
 pve4Tqg1bOx5OZhoECEtV/kbg9gsktz441ORXugCMQznBnqfTF/Aqw3w+SNmtpZkBMks
 odnnVq0gD0QLogRpEsOMw+djRn1ehIW776+MnCHINXVxCRgtL0ce3D4HIPJR9lwE8N9B
 WGUw==
X-Gm-Message-State: AOAM531DKFX5vrhZfKBMghC7t/uKAtZ4/Jx7sxeZxgFmjdrHJHqaDz/7
 b6C2GC2jEIEwHQ99SXmb9GX5Yg==
X-Google-Smtp-Source: ABdhPJzvExI+t8yuXaS1DEStOCB4GW78Viv/TkR5lL+Qjf2kAF0uOwLJYp8MNv5DGGmehSRGmJjLtw==
X-Received: by 2002:a05:6a00:124a:b0:4e1:7cfb:634c with SMTP id
 u10-20020a056a00124a00b004e17cfb634cmr1100314pfi.12.1645066091528; 
 Wed, 16 Feb 2022 18:48:11 -0800 (PST)
Received: from [192.168.1.100] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id lw3sm377109pjb.24.2022.02.16.18.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 18:48:11 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20220215094514.3828912-1-hch@lst.de>
References: <20220215094514.3828912-1-hch@lst.de>
Subject: Re: add a ->free_disk block_device_operation v3
Message-Id: <164506608998.50072.6316036301772123687.b4-ty@kernel.dk>
Date: Wed, 16 Feb 2022 19:48:09 -0700
MIME-Version: 1.0
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-mmc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, 15 Feb 2022 10:45:09 +0100, Christoph Hellwig wrote:
> this series adds a ->free_disk method to struct block_device_operation so that
> drivers can defer freeing their disk private data until the gendisk goes away
> and don't need to play games with the validity of ->private_data.
> 
> This also converts three simple drivers over as example, but eventually I
> imagine that all drivers with private data will use it.
> 
> [...]

Applied, thanks!

[1/5] block: add a ->free_disk method
      commit: 76792055c4c8b2472ca1ae48e0ddaf8497529f08
[2/5] memstick/ms_block: simplify refcounting
      commit: e2efa0796607efe60c708271be483c3a2b0128de
[3/5] memstick/mspro_block: fix handling of read-only devices
      commit: 6dab421bfe06a59bf8f212a72e34673e8acf2018
[4/5] memstick/mspro_block: simplify refcounting
      commit: 185ed423d1898ead071c18f6161959cd3cab2dde
[5/5] virtio_blk: simplify refcounting
      commit: 24b45e6c25173abcf8d5e82285212b47f2b0f86b

Best regards,
-- 
Jens Axboe


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
