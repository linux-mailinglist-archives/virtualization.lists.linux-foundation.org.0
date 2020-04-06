Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60A19F6C2
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 15:21:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 70C61232FA;
	Mon,  6 Apr 2020 13:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rj2jyJPq-fXt; Mon,  6 Apr 2020 13:21:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7E6DE20402;
	Mon,  6 Apr 2020 13:21:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D0CBC0177;
	Mon,  6 Apr 2020 13:21:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CC9FC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 38ACB2013C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJ-8e3jps86J
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:21:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 6F1E120134
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586179277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dt00ToAjgq6odVjJUr2HynAfwKXr6ghEKV21ZUG8JdU=;
 b=D0wZzzdU8PqTR3WbL5BZnu4mgcm6k3MgzZczh6Mct2UWT/MniQVMC6xvVBPeH02lFUp0Fk
 N2PjCGUO4iIECw24eVoCeC+FGJWUErKlmwb0/NIMHaoEcc8HYeNpTg1WWrt0gz66eLaxXO
 l2vkcxnW5uBDjeVLedMAp+0/9HbOepE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-0yG-Dv0lPmaisid9OGfhNQ-1; Mon, 06 Apr 2020 09:21:15 -0400
X-MC-Unique: 0yG-Dv0lPmaisid9OGfhNQ-1
Received: by mail-wm1-f72.google.com with SMTP id s9so4896294wmh.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 06:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dt00ToAjgq6odVjJUr2HynAfwKXr6ghEKV21ZUG8JdU=;
 b=cOMaHoGtii1EYm916ECc2+prM1IPpEn/4sRf2N1bAeE0AdiEApC+1yY7yabyqE01MW
 qziXWSYmYcztEAoskQ5QNj6l0mWXDMRQK8ipTBkpFIb5kmbAGzPgsgwVspvkAHNbd1/m
 Kx/VmsApLKarPmau1m+7v11ZpZSzeJ2IW71i6XGKel96bP0tbLbtQWdxk15NurMwV6Vm
 XcQ3/usm7+8kBe1DVuCY10IvPthoG3fDfUZx+nonjIU/WaD5jJ0Rj8/3+WB8xitDCFoA
 kj52JRzVLae9jNDsQjR01/SiFtOA6GVU2QRovOMxcCaWpF/Ae0oeloHzq+tFUigUklDx
 mrFQ==
X-Gm-Message-State: AGi0PuaMb8P6dalsIrjQrum90Wf3eIZDcsEeBbuiT/GKuwTnkIoBcSUi
 ue//6K/NjI4vQ24TaM78UdMww7aaF2K6CWU/qx3uDmpzuvpIuaQlSxKyq/8atAJsO9wRtFAX2mM
 YJQjm/JqK0B4Yg1UZsN0y5KpvModVgrG6hX9YB4jeNw==
X-Received: by 2002:a5d:42c1:: with SMTP id t1mr11428309wrr.215.1586179274431; 
 Mon, 06 Apr 2020 06:21:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTm0wN4Ob+KU8r6bjP+vUj5Sc5r+ElDJG7FGW/nVL32K8rRyDddIp810vWUMYetH05ffupWw==
X-Received: by 2002:a5d:42c1:: with SMTP id t1mr11428298wrr.215.1586179274273; 
 Mon, 06 Apr 2020 06:21:14 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id z11sm11162174wrv.58.2020.04.06.06.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 06:21:13 -0700 (PDT)
Date: Mon, 6 Apr 2020 09:21:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] vhost: disable for OABI
Message-ID: <20200406092056-mutt-send-email-mst@kernel.org>
References: <20200406121233.109889-1-mst@redhat.com>
 <20200406121233.109889-3-mst@redhat.com>
 <CAK8P3a1nce31itwMKbmXoNZh-Y68m3GX_WwzNiaBuk280VFh-Q@mail.gmail.com>
 <20200406085707-mutt-send-email-mst@kernel.org>
 <CAK8P3a1=-rhiMyAh6=6EwhxSmNnYaXR9NWhh+ZGh4Hh=U_gEuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1=-rhiMyAh6=6EwhxSmNnYaXR9NWhh+ZGh4Hh=U_gEuA@mail.gmail.com>
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

On Mon, Apr 06, 2020 at 03:15:20PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 6, 2020 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Apr 06, 2020 at 02:50:32PM +0200, Arnd Bergmann wrote:
> > > On Mon, Apr 6, 2020 at 2:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > >
> > > > +config VHOST_DPN
> > > > +       bool "VHOST dependencies"
> > > > +       depends on !ARM || AEABI
> > > > +       default y
> > > > +       help
> > > > +         Anything selecting VHOST or VHOST_RING must depend on VHOST_DPN.
> > > > +         This excludes the deprecated ARM ABI since that forces a 4 byte
> > > > +         alignment on all structs - incompatible with virtio spec requirements.
> > > > +
> > >
> > > This should not be a user-visible option, so just make this 'def_bool
> > > !ARM || AEABI'
> > >
> >
> > I like keeping some kind of hint around for when one tries to understand
> > why is a specific symbol visible.
> 
> I meant you should remove the "VHOST dependencies" prompt, not the
> help text, which is certainly useful here. You can also use the three lines
> 
>      bool
>      depends on !ARM || AEABI
>      default y
> 
> in front of the help text, but those are equivalent to the one-line version
> I suggested.
> 
>      Arnd

Oh right. Good point. Thanks!

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
