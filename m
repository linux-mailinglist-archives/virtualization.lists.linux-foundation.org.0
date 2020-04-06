Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A76ED19F777
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 16:03:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B7C812340C;
	Mon,  6 Apr 2020 14:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtVyySVPgCHQ; Mon,  6 Apr 2020 14:03:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A2345231E9;
	Mon,  6 Apr 2020 14:03:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D520C1D89;
	Mon,  6 Apr 2020 14:03:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64864C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5BC86882CC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiEd7wTKsxgo
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:03:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 09601880B3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586181779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wIE9VGUaKQC5F+nmzjS1d1+OM5IgOo8Xu+l1owRvgOQ=;
 b=aUm7cHjt4XTNUI86+qiJrvu+Kdh9tKdovuX2kuW3o46FMLuXFsxYC4ih0kFppbe4RzQC4e
 7rwNiyw1joHsQBh0gQ/wN/XUCq3IF3/g49XHZvWN5BEJvDRwe6I9PUVB2C7QYjLWsPyuPL
 iiRCf8QM1N6EydFBY2JsBLohZHWty2c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-u-EYCA7oOl6UpiyCk7zg-w-1; Mon, 06 Apr 2020 10:02:58 -0400
X-MC-Unique: u-EYCA7oOl6UpiyCk7zg-w-1
Received: by mail-wr1-f71.google.com with SMTP id y6so2266172wrq.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 07:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wIE9VGUaKQC5F+nmzjS1d1+OM5IgOo8Xu+l1owRvgOQ=;
 b=nS2OrB9TVbX6b8GkweyinmETnP9dkNXUADapAs+Dd4o+oIhwQy0FHrMc1ZvuW0OW+R
 n+yXQuVpAUk/JpeiQ4LO7oPdVtvxem6NFgK9gf4FzU00/rRL/zdXKc/9evDWuYzg4dE5
 jWL6AHqvbhMmiSHDxpqclsxyvpH0rCjtDTkobu4fEddp/jkFXxawYwZv8S5xq7yvwXmF
 IvUftGWsbCEcPCWpwOeSmLpladQ+e+E5t/Hrcvpb4yJrHXZ6oiLbbqXUQ+D1V0ScIl5v
 3Vlydn2ycpuBSmYBRDEx8b+TQwdWzAi89Kd+7vrzVm5amw5oAajTxgIXJYsfm1Epgwex
 +Fdg==
X-Gm-Message-State: AGi0PuaaSW2ZbM7FY3v9o0EpTNIgatLDks19ysYLjafDQDLW6ni955j1
 xKqyHpZR5DwSQ+ysH3Q8eknQ/DL35zFYMPv03OathZuvnphEaNfmgcTO3bxNyqNHngSkpHGdwHw
 7ORHOknot1OWZ1uYUsMtajqWkBDGeAiTLRYAZYLAb6g==
X-Received: by 2002:a5d:4c42:: with SMTP id n2mr7789701wrt.178.1586181776087; 
 Mon, 06 Apr 2020 07:02:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKL4+xmI91KCjCdHW6Iun/ZVCiNm2oeP85iziYNrPA4EWRYx4/NJvVV0PiOVKVLUwLXmlPIyQ==
X-Received: by 2002:a5d:4c42:: with SMTP id n2mr7789686wrt.178.1586181775941; 
 Mon, 06 Apr 2020 07:02:55 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h2sm24497540wmb.16.2020.04.06.07.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 07:02:55 -0700 (PDT)
Date: Mon, 6 Apr 2020 10:02:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] vdpa-sim: depend on HAS_DMA
Message-ID: <20200406095931-mutt-send-email-mst@kernel.org>
References: <20200405081355.2870-1-mst@redhat.com>
 <20200406130927.GA20291@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200406130927.GA20291@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Mon, Apr 06, 2020 at 06:09:27AM -0700, Christoph Hellwig wrote:
> Pleae just drop the code - we should not add new drivers with custom
> DMA ops.

I'm not sure there's another way to do this: this not a driver, it's a
software emulator that pretends to be an actual device. We can't
have the platform supply DMA ops here since the platform is a regular
x86 or whatever.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
