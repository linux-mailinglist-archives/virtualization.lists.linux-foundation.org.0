Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F231D199844
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 16:18:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7ADC32040C;
	Tue, 31 Mar 2020 14:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u24GYvVMcarW; Tue, 31 Mar 2020 14:18:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5CD0824F04;
	Tue, 31 Mar 2020 14:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E763C07FF;
	Tue, 31 Mar 2020 14:18:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7E1CC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B281587D6E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P+8gHlHkYTnk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:18:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 030D8876B6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585664304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=utmX18W31kXsBfpUq9t9FaLAztm0XHtfHqqaTLE/HnI=;
 b=XBHJqhmJ9gt3z9d0xW/V0OvEtkCHLfO0qfArN4ka7CADl/cKsYVy+35QKs1pAUdAH+/tex
 Sz74YLDoGUbV38II4mbZkMXcNf2vhxE3zgE2opesY8U55i2lju93dwi7jiRkx9Q3nqrHY4
 ms5H28iZF8rrvqGzdBwYNObpSQQHA5E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-DCSTFY9cNAGDJywvIHZBCw-1; Tue, 31 Mar 2020 10:18:22 -0400
X-MC-Unique: DCSTFY9cNAGDJywvIHZBCw-1
Received: by mail-wr1-f69.google.com with SMTP id i18so12963680wrx.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 07:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=utmX18W31kXsBfpUq9t9FaLAztm0XHtfHqqaTLE/HnI=;
 b=OFzKXHwTv8Z5c7OuJhc+4auGJso49O9p1EtXrxck/8vNq2hHt/62O0KerRokUQcVto
 GLmwbaFTF42x875uOMCbJkgDmulsPZ5wQkL3P+0czWyqtS2CQGiYsN0TDrwTt9UXxihF
 2uYQObmU9UeTHIjUFlNAExb/X4Ee6Wsu1+9V9NUEYjRf0QlvIyy7G3CjP5wI+fQTCfF4
 gNpgYw9AyRth2sX+AerHeHmJej0ybBSzp+QVSx23qiSswEDbnzybAC7lWiMnrKM3SX5X
 qsnXRrpko2Fc71kQC2itrx5GSBhakaVeaT8lWt6lYZf4NRL2KDzhf+uMFy9Co7lYZ9pL
 VXiQ==
X-Gm-Message-State: ANhLgQ0EoR4qfkNuTPrX33WF/T5zWgssm0mP9l51EFYhI/6echBNzCYu
 0AtOeO0ls7IL608qwIV8oQperxCQULLs0bo9HXT6HwFDiJhKb+zQktI3/2gHzlmCZ0GRtLYIDvB
 kR9U46lNSyJyYWxU9Hqi0Pg1nLPkNqq2SpUJXRLSNPA==
X-Received: by 2002:adf:904a:: with SMTP id h68mr19456922wrh.291.1585664301563; 
 Tue, 31 Mar 2020 07:18:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtmKByeMbL7IF4Va4byN+91sp3eGql6iIZ+hxW44PDFMJBJ+l8uaRXS9tqFA+dHHnZNvwqR7w==
X-Received: by 2002:adf:904a:: with SMTP id h68mr19456901wrh.291.1585664301366; 
 Tue, 31 Mar 2020 07:18:21 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id z19sm28466709wrg.28.2020.03.31.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:18:20 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:18:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200331101117-mutt-send-email-mst@kernel.org>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
 <20200331100359-mutt-send-email-mst@kernel.org>
 <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
MIME-Version: 1.0
In-Reply-To: <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

On Tue, Mar 31, 2020 at 04:09:59PM +0200, David Hildenbrand wrote:

...

> >>>>>>>>>>> So if we want to address this, IMHO this calls for a new API.
> >>>>>>>>>>> Along the lines of
> >>>>>>>>>>>
> >>>>>>>>>>>    struct page *alloc_page_range(gfp_t gfp, unsigned int min_order,
> >>>>>>>>>>>                    unsigned int max_order, unsigned int *order)
> >>>>>>>>>>>
> >>>>>>>>>>> the idea would then be to return at a number of pages in the given
> >>>>>>>>>>> range.
> >>>>>>>>>>>
> >>>>>>>>>>> What do you think? Want to try implementing that?

..

> I expect the whole "steal huge pages from your guest" to be problematic,
> as I already mentioned to Alex. This needs a performance evaluation.
> 
> This all smells like a lot of workload dependent fine-tuning. :)


So that's why I proposed the API above.

The idea is that *if we are allocating a huge page anyway*,
rather than break it up let's send it whole to the device.
If we have smaller pages, return smaller pages.

That seems like it would always be an improvement, whatever the
workload.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
