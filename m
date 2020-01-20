Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35114233D
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 07:28:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C4E787020;
	Mon, 20 Jan 2020 06:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mBRfVQkLWNm; Mon, 20 Jan 2020 06:28:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 026428700E;
	Mon, 20 Jan 2020 06:28:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFA8CC0174;
	Mon, 20 Jan 2020 06:28:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF525C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 06:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E44738493F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 06:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7L00E8+NNjg
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 06:28:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DBF27848A3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 06:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579501678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRXHfj3z+qLzyvphJ1jzEOvfcEubFJCVf/G360GhOFc=;
 b=M7RUSHsXMp8x4zRn+27AbQljvDhNVhg8UsmrPFVh+DGfppG2+CR/k2Mbplg/BRT3qNb+/E
 7QxEr1vJeaol0PbiB97BC/ShTL0Bcuwgz5fhIVroXi5ev7ssYARLRGVIZA1+1KaiVaiqsE
 G+Vm4XHg1kPpb2fzj7WA8Kd1JL/7vAE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-RC6tQtRxMhq-KqiP__pafg-1; Mon, 20 Jan 2020 01:27:57 -0500
Received: by mail-qv1-f69.google.com with SMTP id c1so20142145qvw.17
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 22:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iRXHfj3z+qLzyvphJ1jzEOvfcEubFJCVf/G360GhOFc=;
 b=SnqqnMDN8i0jNvvx+mPFRJfLjzNrW4ZL4uS6TN70QQT3ozaXxGsPSlgJ8/cxGzIP0a
 MA9snT3LfzNDGegyBzvtn2b6iPamxs9Wa0P21BOTQ/ii0dQIkmzFPp4skSYoHd/aSIpu
 cFRqGYTNl7+cgU8tiC1B0OC90qXOMJyHLzVoW/1hDMr5LGWqCxI7ByTKYV1FykGpIO6n
 +8wLxLbblyz5BjpH6vnDO4KG3chJHW1C0YHj7gETa60lxqKiAX7KbMwZhJdbMC3aSoAg
 pDFBtLkRegEGkB9IKwV3V7GWTpeOVM7jihbGBA4ToSioy0jKjVJEx0KS1Jrj38Mlzgce
 /gFg==
X-Gm-Message-State: APjAAAWFQiy9BUtf3wvwpa/3Rnw2HUIEAfrF/jB/NeBS+rISuAJftM4k
 kHMVdu2uswljbyj1ExXHtmEHaNic7gi5Cah43qHTjiiA2thPjQpYMPBRJ4zXbsPiVBkZkozXg15
 8esQ/ZHCEy3k/XLQyPvDRSILugfWK1JjtsBTx7YRVQA==
X-Received: by 2002:a05:620a:98f:: with SMTP id
 x15mr49079770qkx.462.1579501676109; 
 Sun, 19 Jan 2020 22:27:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZe1/Gynw9EyezEIEc3j5X8dVt+5Pvag5q9o1DBcyvgoW1L9uIjDRR7cdioBxMsBroG0JIpg==
X-Received: by 2002:a05:620a:98f:: with SMTP id
 x15mr49079759qkx.462.1579501675863; 
 Sun, 19 Jan 2020 22:27:55 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id d3sm16680931qtp.25.2020.01.19.22.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 22:27:54 -0800 (PST)
Date: Mon, 20 Jan 2020 01:27:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200120012724-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
X-MC-Unique: RC6tQtRxMhq-KqiP__pafg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Tue, Jan 07, 2020 at 01:16:50PM +0100, Christian Borntraeger wrote:
> On 07.01.20 12:55, Michael S. Tsirkin wrote:
> 
> > 
> > I pushed batched-v3 - same head but bisect should work now.
> > 
> 
> With 
> commit 38ced0208491103b50f1056f0d1c8f28e2e13d08 (HEAD)
> Author:     Michael S. Tsirkin <mst@redhat.com>
> AuthorDate: Wed Dec 11 12:19:26 2019 -0500
> Commit:     Michael S. Tsirkin <mst@redhat.com>
> CommitDate: Tue Jan 7 06:52:42 2020 -0500
> 
>     vhost: use batched version by default
> 
> 
> I have exactly one successful ping and then the network inside the guest is broken (no packet
> anymore).

Does anything appear in host's dmesg when this happens?


> So you could consider this commit broken (but in a different way and also without any
> guest reboot necessary).
> 
> 
> bisect log:
> git bisect start
> # bad: [d2f6175f52062ee51ee69754a6925608213475d2] vhost: use vhost_desc instead of vhost_log
> git bisect bad d2f6175f52062ee51ee69754a6925608213475d2
> # good: [d1281e3a562ec6a08f944a876481dd043ba739b9] virtio-blk: remove VIRTIO_BLK_F_SCSI support
> git bisect good d1281e3a562ec6a08f944a876481dd043ba739b9
> # good: [fac7c0f46996e32d996f5c46121df24a6b95ec3b] vhost: option to fetch descriptors through an independent struct
> git bisect good fac7c0f46996e32d996f5c46121df24a6b95ec3b
> # bad: [539eb9d738f048cd7be61f404e8f9c7d9d2ff3cc] vhost: batching fetches
> git bisect bad 539eb9d738f048cd7be61f404e8f9c7d9d2ff3cc

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
