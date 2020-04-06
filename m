Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4A19F6C0
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 15:20:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2564287E96;
	Mon,  6 Apr 2020 13:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3s7CjiPCovow; Mon,  6 Apr 2020 13:20:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4829087E8F;
	Mon,  6 Apr 2020 13:20:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29C87C0177;
	Mon,  6 Apr 2020 13:20:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52ADFC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3EA7387E1F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JME0niyNn1G5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:20:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0452287D36
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:20:44 +0000 (UTC)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7Qp1-1jFqxo1rLR-017ibr for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:15:37 +0200
Received: by mail-qt1-f174.google.com with SMTP id a5so12676234qtw.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 06:15:37 -0700 (PDT)
X-Gm-Message-State: AGi0PuaP+qdd5pkLrhHok7CQLrsRWwqIgAz0kSPxK1SxT0sPwPfgsECw
 x1JOv0OxYiAnblC08kmPtilRTgu+6xnwEnZhpQ0=
X-Google-Smtp-Source: APiQypLa5L7CKwlGZNhn/7xAjUoLc+7MSyvfCvi3f7raJ3Pm4QCoa8xTD4iijCH0Ufx8gGRQ4K6mPgVfCzePn/2MrKM=
X-Received: by 2002:ac8:12c2:: with SMTP id b2mr379999qtj.7.1586178935967;
 Mon, 06 Apr 2020 06:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200406121233.109889-1-mst@redhat.com>
 <20200406121233.109889-3-mst@redhat.com>
 <CAK8P3a1nce31itwMKbmXoNZh-Y68m3GX_WwzNiaBuk280VFh-Q@mail.gmail.com>
 <20200406085707-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200406085707-mutt-send-email-mst@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 6 Apr 2020 15:15:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=-rhiMyAh6=6EwhxSmNnYaXR9NWhh+ZGh4Hh=U_gEuA@mail.gmail.com>
Message-ID: <CAK8P3a1=-rhiMyAh6=6EwhxSmNnYaXR9NWhh+ZGh4Hh=U_gEuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] vhost: disable for OABI
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Provags-ID: V03:K1:bZ3oM/85Pd5YKwOzSLnWHTENABkxuwm8FmSKliyrLFZrJ8FLYdS
 pAsf5xFWtOjAybqnUsKb0QlHDYIW5s40plfGoSIvZLywCzQ+ma1O9s02SBQ3W3GwJuR7unQ
 A5XefFLPHuiIldxyJX5bfKOqLFFJYvKXClVBpG2fdmEEooZO1wBw9NwsddvpFky/JDJCrlS
 tLnJDqYmSxC/HZVGOPEgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LIksEMfoows=:TZjmarGg70R3r1+XHMM/hH
 7VDIcm8PosR+9yzSOut4cfVdLBOPOZp1AUEy/ZdMDeV7rDyDjmgljsBqFeIoVWS3tdnYqGB8Z
 H/7QsgWGqQc0MgxPIr0y6LQJom4Onzt+iOVA6QcrS7i4stmGC9EXTV0CIMBLPH7tFEg2Lniwl
 Eet6PrqnaxEwtBbaGeLW0Y9dndbtaUSFh1yNxUVKbiOCE3xqDfhb6ywOPLvi0w8cZZThK9XfB
 8NabUmpVphpPCV6OGiiFUPVOH5UkbaCD4yvWtauTEbdmbzf0suIA+HRdpSEwe/3UlJxIst6HS
 9uT7e+ZwsYp779839rqqBVYSPM/xT7FsDz2DI5BHeUTtpcgNcQEBd6ZPk11cCIXBcTKuDiMyA
 e/4uKMH0xqWPGkcEFeOsQLrysWOXjCnvnGck/jrSr3PZTrEh4x59RBwLQzwnhLZjWkfs5Fdzs
 9hIvsmbuOMnEWXF3NxSCrqr8d/foxX2eZ4UQ8Ay+MEypU9L5uYkrHkcHLuLq/YG2GOmHzJJDG
 WBi72dQWtEBLAENEeaE7ynVgxx4AWhUXcY6pCUsHQKZvkfIbpOQuvTFnWp+95YmKdVvJYHdT0
 A9eFF/zF4WPEALRJjrgtPXGjQ2/Wj7QrGSTSImJFhccOmoACZrTYjQoKZNfJbOq6BI71QaJE2
 HECqvSoPf3LlnmC2Y4jCSI4taVbqP4UT2uSPJR3cbE0HeCtuECL7sdafAuNarxXT7EPepbOn7
 B0mL91NvKksu+hu7fM1DBuSL/bspaM5+UuZOvM4+x12rp6qOdmhwm1vcZ6M62kTIY7yQtbn3r
 ukFy8BfxjfTECEiLzLZ86/zJO/T4ETj4/nEdZCTxedVfDohG6E=
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

On Mon, Apr 6, 2020 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Apr 06, 2020 at 02:50:32PM +0200, Arnd Bergmann wrote:
> > On Mon, Apr 6, 2020 at 2:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > >
> > > +config VHOST_DPN
> > > +       bool "VHOST dependencies"
> > > +       depends on !ARM || AEABI
> > > +       default y
> > > +       help
> > > +         Anything selecting VHOST or VHOST_RING must depend on VHOST_DPN.
> > > +         This excludes the deprecated ARM ABI since that forces a 4 byte
> > > +         alignment on all structs - incompatible with virtio spec requirements.
> > > +
> >
> > This should not be a user-visible option, so just make this 'def_bool
> > !ARM || AEABI'
> >
>
> I like keeping some kind of hint around for when one tries to understand
> why is a specific symbol visible.

I meant you should remove the "VHOST dependencies" prompt, not the
help text, which is certainly useful here. You can also use the three lines

     bool
     depends on !ARM || AEABI
     default y

in front of the help text, but those are equivalent to the one-line version
I suggested.

     Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
