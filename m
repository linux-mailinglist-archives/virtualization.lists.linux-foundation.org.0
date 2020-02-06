Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DD99F15412E
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 10:31:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 94E3A2012F;
	Thu,  6 Feb 2020 09:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8es6fV51Q9D2; Thu,  6 Feb 2020 09:31:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 00FDA2001D;
	Thu,  6 Feb 2020 09:31:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E761CC013E;
	Thu,  6 Feb 2020 09:31:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2E83C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9FC6C85E40
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bQ2ek3w9jeM
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:31:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E60F785E27
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580981470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=psVaYKxFuuF5hk8zbxTLl+GgL61u3jQrB7tk6Ar+Q/A=;
 b=iTnKmGqioJPo9IOnAJeWcvwu1g+5ZskTnmravPegy93j2PoPJBk8jyN4yHYYgCjkn3gBYz
 FxGGwcwrT8gYhm6rn49ZcsQPfsR9AszPvipN7zJuouYhrrBtvH0ykbE1N8CS2Yc/7rCF5y
 P1QcJyvB2805Uuu93S+D/hLuJCf9ZuY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-FauTAMIeMgy0DulDZaCgig-1; Thu, 06 Feb 2020 04:31:07 -0500
Received: by mail-qk1-f198.google.com with SMTP id t195so3150803qke.23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 01:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=psVaYKxFuuF5hk8zbxTLl+GgL61u3jQrB7tk6Ar+Q/A=;
 b=uUeDA1C7DEQGP3bHHPm39cUQOCb/DwXuVQ8Wr4iean+1viBzkg5+2ODtsPqkngraOl
 rUhzVpxCbwk1+mu8wUCl+cqxmNiX1vmBGdYaaDOgy2ICodRRmdSY2q9718sg0lAyQQVz
 0UokzFbHUc22TKCrGuw91y9a8ns6Psn+UJoN2MYXXD6CU2AKlO9anGABhPtfsrjtchMo
 wmGWa7H8wBmMIKNX1dkJLXaG7S1nwF2HKedA6ppd/pxuGpPH9jRuu1UWozpNRV8QejHb
 rdxcKo214pOhF+NEYpgKjlaAibqL7vbH7tWoE/mS3xyz8a3QcFqG/ZQM6vG9EnlnZl8E
 snsg==
X-Gm-Message-State: APjAAAU2OUorfdBYmL/D0xi1z3ZkfCkdYZ+NWzWfot358zGsJ93nJ5Sz
 hCA+8Ozy6I+eIjYUmVEz68iz9grPuQkYXcqx1vS1Z4FRC0HZR/n+e1APTqmQOy/pLncwJv/2JzB
 oNA3178J3NocvqZIda4ifLRmPazxvO9zaduQZ62J6jA==
X-Received: by 2002:a05:6214:1633:: with SMTP id
 e19mr1574656qvw.104.1580981466904; 
 Thu, 06 Feb 2020 01:31:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvhH9O4kuho2eszbvtS5e0sl+BYezuhs23uPCqeDjbd7YrUd9ZJ/qbYGlJqsgoS72fpdmLfg==
X-Received: by 2002:a05:6214:1633:: with SMTP id
 e19mr1574635qvw.104.1580981466697; 
 Thu, 06 Feb 2020 01:31:06 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id o6sm1127547qkk.53.2020.02.06.01.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 01:31:05 -0800 (PST)
Date: Thu, 6 Feb 2020 04:31:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Message-ID: <20200206042824-mutt-send-email-mst@kernel.org>
References: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
 <20200206035749-mutt-send-email-mst@kernel.org>
 <286AC319A985734F985F78AFA26841F73E4238A5@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <286AC319A985734F985F78AFA26841F73E4238A5@shsmsx102.ccr.corp.intel.com>
X-MC-Unique: FauTAMIeMgy0DulDZaCgig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "tysand@google.com" <tysand@google.com>, "namit@vmware.com" <namit@vmware.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "alexander.h.duyck@linux.intel.com" <alexander.h.duyck@linux.intel.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>
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

On Thu, Feb 06, 2020 at 09:27:04AM +0000, Wang, Wei W wrote:
> On Thursday, February 6, 2020 5:04 PM, Michael S. Tsirkin wrote:
> > virtio_balloon_shrinker_count(struct shrinker *shrinker,
> > >  					struct virtio_balloon, shrinker);
> > >  	unsigned long count;
> > >
> > > -	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
> > > +	if (conservative_shrinker && global_node_page_state(NR_FILE_PAGES))
> > 
> > I'd rather have an API for that in mm/. In particular, do we want other
> > shrinkers to run, not just pagecache? To pick an example I'm familiar
> > with, kvm mmu cache for nested virt?
> 
> We could make it extendable:
> 
> #define BALLOON_SHRINKER_AFTER_PAGE_CACHE	(1 << 0)
> #define BALLOON_SHRINKER_AFTER_KVM_MMU_CACHE	(1 << 1)
> ...
> 
> uint64_t conservative_shrinker;
> if ((conservative_shrinker | BALLOON_SHRINKER_AFTER_PAGE_CACHE) && global_node_page_state(NR_FILE_PAGES))
> 	return 0;
> 
> For now, we probably only need BALLOON_SHRINKER_AFTER_PAGE_CACHE.
> 
> Best,
> Wei

How about just making this a last resort thing to be compatible with
existing hypervisors? if someone wants to change behaviour
that really should use a feature bit ...

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
