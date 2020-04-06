Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939919F64A
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 15:02:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF43A86311;
	Mon,  6 Apr 2020 13:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_X2WzCIpExw; Mon,  6 Apr 2020 13:02:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7AD95862C9;
	Mon,  6 Apr 2020 13:02:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FB3BC0177;
	Mon,  6 Apr 2020 13:02:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C81DBC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B15F587AC8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61LGswyIPhyf
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:02:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D39A387A60
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586178129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPjD/qOa5eohxkp3ciJYq8E962y8rH1Z+TEQ1dfdaNU=;
 b=LIVgOdOL/H71WNHI6o90ZKZ+LyhODZU3q3afogGyvFjRXlAPPvL3ipCXzVo2FfjBG6GkAQ
 g9216cAy+xzFi+rIOBohXTlybg5OX3Nl73WkqmalatmzM9WhNoggwaClz7i7YOmnb9Upwh
 4aEol6VgOQiLIpykmU8hxnvHAzs5nl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-uWNaBahzMROFeMB_cNTM9Q-1; Mon, 06 Apr 2020 09:02:07 -0400
X-MC-Unique: uWNaBahzMROFeMB_cNTM9Q-1
Received: by mail-wm1-f72.google.com with SMTP id 2so4875902wmf.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 06:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VPjD/qOa5eohxkp3ciJYq8E962y8rH1Z+TEQ1dfdaNU=;
 b=ZpUP7CFFiGNylLZ2sD1Mf+HLySwUIHI1+xWpZtUmlxeX+KrKqIgMi17tTUvVRbuDqR
 FaX4sNb7isCA4cK7t4SOrqlYlRddVyVb1jmg5vjgCumvW1pufbJYPHmP9qBUBSrkLBwt
 mOAZk3RsLJYippY3SP3qgt7d+nVJkAH/PU3EcJZZDA/gkeODGfpW6Ypb9mgzdhIiAMjU
 ZHTstWC5/djqptEf2COKW99EEKKMvUYkEU899apN6cK8G+ncdSLfzAGw3dq+Zu/LdKrm
 7djEM5/PgYl5AtUrNp3Bf3ppLsF+tHpoOJX4Xzm59oFFr9iMrZh3ftlmKUA22gUFtbMv
 aN1A==
X-Gm-Message-State: AGi0PuZzqFL0fq7wp9aCYS5jaA2rVT9onBepuk122OmNCTY2WPGV07Wf
 qa7YE7VR3xVnHKSenJZEqMdam1LaQxrsgEKIb50HOZVt28L0q0K3wjDR78SW31MzDcf9OAT7CDR
 D/a0PzlS9hieg+OfVuPLHgtUU0G10P/YZiZqWf0PpYQ==
X-Received: by 2002:adf:a350:: with SMTP id d16mr23217853wrb.277.1586178126528; 
 Mon, 06 Apr 2020 06:02:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzhJTMgG+3y4mdFbTRg4CPv7sYAgX9HM+UKNa2TYFJhIuv1nrWp08PsZCLMr3COjkc520wRg==
X-Received: by 2002:adf:a350:: with SMTP id d16mr23217808wrb.277.1586178126236; 
 Mon, 06 Apr 2020 06:02:06 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id n1sm13731659wrw.52.2020.04.06.06.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 06:02:05 -0700 (PDT)
Date: Mon, 6 Apr 2020 09:02:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] vhost: disable for OABI
Message-ID: <20200406085707-mutt-send-email-mst@kernel.org>
References: <20200406121233.109889-1-mst@redhat.com>
 <20200406121233.109889-3-mst@redhat.com>
 <CAK8P3a1nce31itwMKbmXoNZh-Y68m3GX_WwzNiaBuk280VFh-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1nce31itwMKbmXoNZh-Y68m3GX_WwzNiaBuk280VFh-Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kbuild test robot <lkp@intel.com>, kvm list <kvm@vger.kernel.org>,
 "christophe.lyon@st.com" <christophe.lyon@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 "daniel.santos@pobox.com" <daniel.santos@pobox.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Networking <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Mon, Apr 06, 2020 at 02:50:32PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 6, 2020 at 2:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
> >
> > +config VHOST_DPN
> > +       bool "VHOST dependencies"
> > +       depends on !ARM || AEABI
> > +       default y
> > +       help
> > +         Anything selecting VHOST or VHOST_RING must depend on VHOST_DPN.
> > +         This excludes the deprecated ARM ABI since that forces a 4 byte
> > +         alignment on all structs - incompatible with virtio spec requirements.
> > +
> 
> This should not be a user-visible option, so just make this 'def_bool
> !ARM || AEABI'
> 
>       Arnd

I like keeping some kind of hint around for when one tries to understand
why is a specific symbol visible.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
