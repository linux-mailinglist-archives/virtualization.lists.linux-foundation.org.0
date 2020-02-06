Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 871111542FD
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 12:26:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 176DC85F4E;
	Thu,  6 Feb 2020 11:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzYl9d8V6bCH; Thu,  6 Feb 2020 11:26:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B117685F34;
	Thu,  6 Feb 2020 11:26:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82DC9C013E;
	Thu,  6 Feb 2020 11:26:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 716B3C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 11:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 675EF85772
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 11:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2eE5LgmbovM7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 11:26:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D89B8510C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580988403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5piNXc1fMT29Zpv4Z7TyeSYOjlJ928bleKih104+/Vg=;
 b=UBRy7ulQ06UGkmM+jakhjLKna+KOi4UO3Olz0AT5rWGUfTUipfucm83GK5uZaruHqrVTJ0
 N53LinAgRSN6kL1MeHduSctPQ1oW1h+uCQ8mNcSXLcI2vhXQFr2hCZjb+h942k1wC9CWpc
 IAMXJjJO6qCvBD3tDBkrGa25r+U4wCU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-qufN_jxINRaIi3F6XGB8ew-1; Thu, 06 Feb 2020 06:26:42 -0500
Received: by mail-qt1-f200.google.com with SMTP id d9so3600765qtq.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 03:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5piNXc1fMT29Zpv4Z7TyeSYOjlJ928bleKih104+/Vg=;
 b=OBLrBPbOJGFt7S0u6pMOisPRyypcY9rRMinzy1F7UzRhoZyIzFGn6AoZpwePeCEqWf
 IaviU9VTlTnKvyrJ1pQwez2nUI0tnVVLzUf/jEJ3Q0WS+ogqVnTBjVGbjF0snGwhKZWY
 SQtwmhQWIHeslo9Ut67OvOOxVsiw4+mzUmgtVY8LJdzYYf/yEsd/pDjLXzkCCVhPoBIm
 ZSYsRkEgHuoqzow9kjiEAY8MYjcKYoR1mfqLi5VPcR3uw1GUPSoWctAqoU+OiGaQ/1vX
 u/BwIqn9XQP29OuG3kF6gbdXU1iTEaY5utNGZZ09I9YIX+st3/83+myRGU3f+/+I2FGF
 tuag==
X-Gm-Message-State: APjAAAWnplPFpjBMBkUp+sgI7s64L3+Bo925zg7PZrSJszQuL7P95wQK
 MkKUe/aeIWLE0jUEmLqQw+86e0s7ZeWhfJyLHie/tpvATRWFscH/BeNlLaErxk1tq0ixo3BQgNM
 d/kpUs+nVr0GXnqtLwi9i5Xyv7Xll4WSC89hb1sF9wg==
X-Received: by 2002:ad4:4434:: with SMTP id e20mr1838480qvt.157.1580988401903; 
 Thu, 06 Feb 2020 03:26:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzs2H4Ue1BislOS6JG/nHk8GpbKHgxSbqwXwcwg9tcef/fex6WCKz5lI8ZaFpUYEjzL720t+A==
X-Received: by 2002:ad4:4434:: with SMTP id e20mr1838467qvt.157.1580988401685; 
 Thu, 06 Feb 2020 03:26:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id b24sm1422245qto.71.2020.02.06.03.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 03:26:40 -0800 (PST)
Date: Thu, 6 Feb 2020 06:26:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Message-ID: <20200206062558-mutt-send-email-mst@kernel.org>
References: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
 <20200206035749-mutt-send-email-mst@kernel.org>
 <286AC319A985734F985F78AFA26841F73E4238A5@shsmsx102.ccr.corp.intel.com>
 <20200206042824-mutt-send-email-mst@kernel.org>
 <286AC319A985734F985F78AFA26841F73E42395B@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <286AC319A985734F985F78AFA26841F73E42395B@shsmsx102.ccr.corp.intel.com>
X-MC-Unique: qufN_jxINRaIi3F6XGB8ew-1
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

On Thu, Feb 06, 2020 at 09:43:10AM +0000, Wang, Wei W wrote:
> On Thursday, February 6, 2020 5:31 PM, Michael S. Tsirkin wrote:
> > 
> > How about just making this a last resort thing to be compatible with existing
> > hypervisors? if someone wants to change behaviour that really should use a
> > feature bit ...
> 
> Yeah, sounds good to me to control via feature bits.
> 
> Best,
> Wei

To clarify, shrinker use could be a feature bit. OOM behaviour was
there for years and has been used to dynamically size guests.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
