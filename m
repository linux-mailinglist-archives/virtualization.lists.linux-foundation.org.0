Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A80C15C56F
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:59:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA9B683204;
	Thu, 13 Feb 2020 15:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rk3+2kiEiscx; Thu, 13 Feb 2020 15:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA71081EE6;
	Thu, 13 Feb 2020 15:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78F68C0177;
	Thu, 13 Feb 2020 15:59:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2F58C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AA29E86DAC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycnydPG28QZ9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:59:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08D4E8776C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581609584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YjESY5U+42gtKNpvEnDRTyHV+mXqJmvUAfYgrE7ny0Y=;
 b=iEuMHtMDQJGT4zIAt7kB0SgAoxppHf57ldT9HPdxkD0viABA+r+tkEXUR26GeUm2ouQMxX
 vUkUtdcFyX4wI0ATfy/TXFUoxc11eKOZpJAsUid0VKbVNl1tF78z1mQaMh5JdrbWqT7eGe
 ssShISjdGZKx/w8/nlOOL0vz229uI1U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-d_p3hWycNrWk5T4hF1WJBg-1; Thu, 13 Feb 2020 10:59:42 -0500
Received: by mail-qk1-f199.google.com with SMTP id c77so4011663qke.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YjESY5U+42gtKNpvEnDRTyHV+mXqJmvUAfYgrE7ny0Y=;
 b=L4ve4fFfQy9w8IURqp8ROhe9GhRIkiDLSpsIby4CDo6Ihn4/vO6BSJ3JViRAQpLajl
 wRPVEBj/bxm/klDEGRtpETG7d2KLbk/Y1Ke6iwEbPR7kGCywKY6VAalFRgzkqA9wFpFy
 C21H8dcsmlkXFmnyStSEW3nP+2j49HSI0K3rZWeSuU2xwnkRSc7A29UHYUoPbvnUIqe8
 1kMsTlhuzq+JSXtqdLrZv8nEdqzHU7NbShGuvTzDIkB8ft9MWQtQ4YpfsyngFxT5jtIs
 BzK48lFpM8BO6f5ZefPaRk08WKS41DMXLzgBbVovTsz/mj3NIyGESXxlNiLJAqOnd2gv
 QGIQ==
X-Gm-Message-State: APjAAAXwwlC1amMkvQ0ae1//IyRZKkee9BHa2vWXdfqW/Nob3ktPpxhk
 KK0BgPXCPljAhzBHa+XFCkKJXXqLn/ewRH5EOMPMSW9cy/cXkhPxArTmf/ZMLJ6Aq6j2iAZO4F0
 kwalZbaiV+j25ginF7AZguvVVY4zn9LfgmqPGoJsyaA==
X-Received: by 2002:a37:648c:: with SMTP id
 y134mr12655822qkb.112.1581609582443; 
 Thu, 13 Feb 2020 07:59:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwblUv4o0toVmVYl/HEAfrRzni+p8oGrxwrOCdC64VBDuyyCDEhJs814GPsgJHzOlkKNS9BGQ==
X-Received: by 2002:a37:648c:: with SMTP id
 y134mr12655792qkb.112.1581609582252; 
 Thu, 13 Feb 2020 07:59:42 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 b7sm1490925qka.67.2020.02.13.07.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:59:41 -0800 (PST)
Date: Thu, 13 Feb 2020 10:59:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Message-ID: <20200213105743-mutt-send-email-mst@kernel.org>
References: <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <20200213103714-mutt-send-email-mst@kernel.org>
 <20200213155154.GX4271@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200213155154.GX4271@mellanox.com>
X-MC-Unique: d_p3hWycNrWk5T4hF1WJBg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, mhabets@solarflare.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

On Thu, Feb 13, 2020 at 11:51:54AM -0400, Jason Gunthorpe wrote:
> The 'class' is supposed to provide all the library functions to remove
> this duplication. Instead of plugging the HW driver in via some bus
> scheme every subsystem has its own 'ops' that the HW driver provides
> to the subsystem's class via subsystem_register()

Hmm I'm not familiar with subsystem_register. A grep didn't find it
in the kernel either ...

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
