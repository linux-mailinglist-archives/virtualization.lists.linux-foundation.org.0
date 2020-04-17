Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB21AE11B
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 17:28:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 049E884525;
	Fri, 17 Apr 2020 15:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7nxIXtDAzHy; Fri, 17 Apr 2020 15:28:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 63C6E8436F;
	Fri, 17 Apr 2020 15:28:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57027C0172;
	Fri, 17 Apr 2020 15:28:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EEC7C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 15:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2AD3D8436F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 15:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL6k6BfDe6fX
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 15:28:50 +0000 (UTC)
X-Greylist: delayed 00:55:42 by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01B82842F2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 15:28:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g6so1248546pgs.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6cWP5WK6ujku9y43wjaNC6S0VeElTh4yenPv8t29Ak=;
 b=gKw5eoYUIpd77RsZ9EA4/OBI5it3b4QtTk5w0WNiaVsQlhU0AvTC99Kwb6pyQrnZwb
 8mkxqNjg6VEOZTZqnkLOebZlO/n/v5mMNjfkBB1cGO3Fx7O3pVDrmTfYyuyYufQ9ccR3
 RtPWKLjDzCOGMUWt9saeSwmpszseuFa+iiXqlLA7QMz5NdgXvU//k288EsKe0YfAzi6u
 dvmxk+qgp7K7fE2PnVT7fvqSgeWduMN7B1pblLGgZqKs3H1NpzAxQ5FN/ffFSwvnE0Dr
 z0qCKxdTOrenMDSXdIXvCN19QGBDvsZe/1e/6pTgbuMcknn8YL4CeODkrzae32Dl8ywr
 FA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6cWP5WK6ujku9y43wjaNC6S0VeElTh4yenPv8t29Ak=;
 b=P1iltErPcvfFUZluTdlChEAEe2MIaZky/OEMavOsGN9Ieicvy7+15cYU/HPlvOtz8S
 R06AS7jvdVMho7FC9Y2+pNUTHG0EhYnKLDlatbCJ9zRefAFDPogQF4PyW0zS6UM99dra
 JUDvoVWuUlGrXroZrzDcSoaURol+8E7a7LkRLJHkTMpBnooD8HVo55S8BStValZnxq0z
 RROHUmzrQ9GHA043cDP9UNwCQXu36P8No6gRqb9d4fy2hhqs3gKh/Drcbft+3X4ihxZn
 ovUYz+Bb+RQmgL2mBl3FvC9umwM0T++FynQxgCDhZ6UUDF6yWNsEB5uLFgqUMkQ+pN5m
 Iqew==
X-Gm-Message-State: AGi0PuaVQ9LwjsKsjEMbTcEbqeXfnj1pBc7lW6FyDsxo3A2dbWDkFNNs
 ShF66VeDNGuWAm/KdJUkpY8gKpKtci0UWA==
X-Google-Smtp-Source: APiQypLk3UKQ7IlVU68RBsk4YcfumTB0+HNr5I6KmasWP50lwGXPB60OmHhJAmy9VXUBKXWGkLn5iw==
X-Received: by 2002:a63:1662:: with SMTP id 34mr3312317pgw.117.1587133542614; 
 Fri, 17 Apr 2020 07:25:42 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.145])
 by smtp.gmail.com with ESMTPSA id r18sm579944pfg.120.2020.04.17.07.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 07:25:41 -0700 (PDT)
Subject: Re: improve use_mm / unuse_mm v2
To: Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20200416053158.586887-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8d314bc3-ea59-684d-2d34-20b152a36f4f@kernel.dk>
Date: Fri, 17 Apr 2020 08:25:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416053158.586887-1-hch@lst.de>
Content-Language: en-US
Cc: Felipe Balbi <balbi@kernel.org>, amd-gfx@lists.freedesktop.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
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

On 4/15/20 11:31 PM, Christoph Hellwig wrote:
> Hi all,
> 
> this series improves the use_mm / unuse_mm interface by better
> documenting the assumptions, and my taking the set_fs manipulations
> spread over the callers into the core API.
> 
> Changes since v1:
>  - drop a few patches
>  - fix a comment typo
>  - cover the newly merged use_mm/unuse_mm caller in vfio

You can add my reviewed-by/tested-by to the patches, passes the
io_uring regression tests.

-- 
Jens Axboe

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
