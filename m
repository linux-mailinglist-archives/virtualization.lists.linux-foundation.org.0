Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A88911D272
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 17:40:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4744388871;
	Thu, 12 Dec 2019 16:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Np+mKFBdcewa; Thu, 12 Dec 2019 16:40:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 356D38886F;
	Thu, 12 Dec 2019 16:40:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21B2FC0881;
	Thu, 12 Dec 2019 16:40:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE4F4C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 16:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C752120485
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 16:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvdTeq5hoej0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 16:40:36 +0000 (UTC)
X-Greylist: delayed 00:05:10 by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B99F71FCB5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 16:40:36 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id p8so2545775iln.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3FtLIVj+wnM2ARUnkHjLCIs+M1M/IA6PpWp8jtXGxBs=;
 b=xbcplkXMsLKBVhI2XoEAIhOCDrqD47HX6n1yvO5V22GmwrrQQBKbWggYHs4jvP1r5e
 d06kkPEOnjJE94l1i8s0OQBGyq2uCnz06HSXakJyefIeamZrYC04IsPHZG0q8AamKYX7
 hQiBFF2unkfh+vzBU4sfnsk8eFSJqiqGb27+ELN3raRO+1VzqxuUmJvQteWCoq4j74gw
 zDZjlxcYlLJc7nj02zY/1J5oio91PD6bX3m6ftojddzXMI4lyWGMcOBLF2IgQDl1+DS4
 M8/9vHNTZSCqOo/1DexoCnH9ZtJ4bViECOh2oT+MHZ1qxnhhm7JEOSFNx7VJQCROP4qJ
 4jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3FtLIVj+wnM2ARUnkHjLCIs+M1M/IA6PpWp8jtXGxBs=;
 b=a/4lajTV/zbGyjmVZzL3RLzTh1byxvaPXlnEEPTnuNTAcHXcjhXRtSvSjUYhWmjTkx
 oyNebJ6Jd5rYWqjO3sW5+MN+DrExFksiSWHo2plwF4aJt06y1jBJYZtn7Wor7kQEAU8N
 WX7esY+2FvMC8pEgYFKTl+DUM7+2raJ0VVVITylY0ktVC6Qp1P5nOeMWrdJAlJpzcIWU
 M018bOOskDxVN523OgGLixre2nQfixsBh9m1ifKOTiB6p59XjLAwqr/BPNleZWHR7vpk
 Nf6EsGJxrBGE80kv6ErbukdXak/RuUZ8PeOPjedIfGoPFp3dYac6G+8RBoGt1BiJBL5X
 2FIQ==
X-Gm-Message-State: APjAAAWHmaZ/FfUmWsCu8/9n0iqEyrLVTp5MU+ACpHHHnlwdIWeW2CNL
 K6z6ejTJmBQgxANAfRCAD94cqg==
X-Google-Smtp-Source: APXvYqxAPt9ybQh/T8WYBX6qxbHJzz4zpYaVA1B8qE0Zhi2chspe24qfeJl3SeUOs00SEoxpnZbeng==
X-Received: by 2002:a92:5d03:: with SMTP id r3mr8554165ilb.278.1576168525332; 
 Thu, 12 Dec 2019 08:35:25 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id x62sm1843784ill.86.2019.12.12.08.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 08:35:24 -0800 (PST)
Subject: Re: [PATCH 15/24] compat_ioctl: scsi: move ioctl handling into drivers
To: Christoph Hellwig <hch@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20191211204306.1207817-1-arnd@arndb.de>
 <20191211204306.1207817-16-arnd@arndb.de>
 <20191211180155-mutt-send-email-mst@kernel.org>
 <858768fb-5f79-8259-eb6a-a26f18fb0e04@redhat.com>
 <20191212162729.GB27991@infradead.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6e265890-23e5-6368-4e36-d59ff47879b2@kernel.dk>
Date: Thu, 12 Dec 2019 09:35:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212162729.GB27991@infradead.org>
Content-Language: en-US
Cc: Hannes Reinecke <hare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, y2038@lists.linaro.org,
 Damien Le Moal <damien.lemoal@wdc.com>, John Garry <john.garry@huawei.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Kai_M=c3=a4kisara?= <Kai.Makisara@kolumbus.fi>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Doug Gilbert <dgilbert@interlog.com>,
 linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Bart Van Assche <bvanassche@acm.org>
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

On 12/12/19 9:27 AM, Christoph Hellwig wrote:
> On Thu, Dec 12, 2019 at 01:28:08AM +0100, Paolo Bonzini wrote:
>> I think it's because the only ioctl for virtio-blk is SG_IO.  It makes
>> sense to lump it in with scsi, but I wouldn't mind getting rid of
>> CONFIG_VIRTIO_BLK_SCSI altogether.
> 
> CONFIG_VIRTIO_BLK_SCSI has been broken for about two years, as it
> never set the QUEUE_FLAG_SCSI_PASSTHROUGH flag after that was
> introduced.  I actually have a patch that I plan to send to remove
> this support as it was a really idea to start with (speaking as
> the person who had that idea back in the day).

We had this very discussion two years ago, and we never got it removed.
Let's please get it done.

-- 
Jens Axboe

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
