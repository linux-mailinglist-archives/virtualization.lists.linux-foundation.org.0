Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2389182433
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 22:48:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79CDE86D95;
	Wed, 11 Mar 2020 21:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sqdZFBAxbJV; Wed, 11 Mar 2020 21:48:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E62786CF9;
	Wed, 11 Mar 2020 21:48:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26BDAC0177;
	Wed, 11 Mar 2020 21:48:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C096CC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 21:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AEDB089336
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 21:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBGvjnUbKInu
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 21:48:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08AD0883FF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583963311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=trXAOUXf8R0jK9KyR9z+fLazglkIkKVNTDuFFKwZMaA=;
 b=UV5wUUd5pZG15WGrANNs81q/tV8DRsXwqzOj8M6xp6mip6OHu8OxVfNjbQEIqXhFZLK+dw
 P2luAUFocGiEGCTmH/SkA/vl7f4UZRE8ejjEV/T6nhOY2BLzVN38y0gGFFEN1CbqDljHkq
 oy0h1EhHa8+e3Du699GR2Ec2IbocOjY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-1C-w0lPbPmObGFWhet3ZYA-1; Wed, 11 Mar 2020 17:48:29 -0400
X-MC-Unique: 1C-w0lPbPmObGFWhet3ZYA-1
Received: by mail-qk1-f197.google.com with SMTP id w124so2445411qkd.19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 14:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=trXAOUXf8R0jK9KyR9z+fLazglkIkKVNTDuFFKwZMaA=;
 b=lYcyVkpUwfCOJWMrs9tOALSz3vSNnegr/GnZd/xEkUNQHhJCsiLw2lxITa8tadEhxq
 +gWz5u2BBjfTsTKzdZyRIFjC8KhyX2rg34DpOtiSr7v9z+U7m8Ce8HKlbgyZnm0jMnHA
 VedUEIZccaWaTGBhIUe4VvSey2dQByhLM4pk++v1nVpTqNBtV5YnKdXva9ELBf+2odS5
 6+Sz3xVVw9OYJzFz5XVhyTZC3RBVYqsgyVUPOQ9ht7NfmS0Xu0N88LsKygeftGpWHhye
 APmdtaoSfDR60T0FRIo0vKUu8EurQfx5rd6AAnEaYz8iU319OkklFQdvKUS0yjiHU5bl
 fTBA==
X-Gm-Message-State: ANhLgQ0ksIgOJyu9D2JJQMGKu+irAm9K/2451uWprq9z0SHg7ARDlssv
 DuNZVYRNwB/A/kPnhJHH1UF2HbD52SmRnyjY2uU7ikWvQwBPvXFJiVRmZ3jbbQlOgc+RwaOXWVB
 9TjYVAbuBUwId7FtCxeAJkgLhvwM1sbKuOB1dlo3hjA==
X-Received: by 2002:ac8:4d83:: with SMTP id a3mr4594407qtw.259.1583963308859; 
 Wed, 11 Mar 2020 14:48:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtsEzdKfH7m2m28mgkpshSZzeyzQQNiRjBtaqGOgSv+gSun0NAQfBN9Lban03PlKiUdtVlsFw==
X-Received: by 2002:ac8:4d83:: with SMTP id a3mr4594391qtw.259.1583963308679; 
 Wed, 11 Mar 2020 14:48:28 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id g7sm251268qki.64.2020.03.11.14.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 14:48:27 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:48:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200311174348-mutt-send-email-mst@kernel.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7BE404@SHSMSX104.ccr.corp.intel.com>
 <20200311174822.GA96893@myrica>
MIME-Version: 1.0
In-Reply-To: <20200311174822.GA96893@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Boeuf,
 Sebastien" <sebastien.boeuf@intel.com>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

On Wed, Mar 11, 2020 at 06:48:22PM +0100, Jean-Philippe Brucker wrote:
> Yes "not elegant" in part because of the PCI fixup. Fixups are used to
> work around bugs

Not really - they are for anything unusual that common PCI code can not
handle on its own.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
