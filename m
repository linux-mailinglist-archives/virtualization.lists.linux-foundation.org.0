Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C80FE19F617
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 14:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 651F9884A2;
	Mon,  6 Apr 2020 12:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWJZJ+SrqUaH; Mon,  6 Apr 2020 12:51:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38FE9884A7;
	Mon,  6 Apr 2020 12:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28CBFC0177;
	Mon,  6 Apr 2020 12:51:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DA3CC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 16C0185624
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFqL3o0DyrRN
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2A0D986268
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:50:52 +0000 (UTC)
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MqJZl-1iyjdp1QUF-00nTmX for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:50:50 +0200
Received: by mail-qk1-f174.google.com with SMTP id v7so15988967qkc.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 05:50:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuZuDDjpsMBHH6w3ZtYqxdrHkmOeig+FBnTS/C0E/AKerCBEjozb
 T+I8o546NQFXAlG35mQrVNmOcDqbX1HyCSM8Uq4=
X-Google-Smtp-Source: APiQypICKUA2vrOK5Bc2jX1TRNULphU8psoKiSX0vN3LLQCWOU+hQ1MKp843zvn0fSuU8msATIvGOPavJwM6FiL0u+U=
X-Received: by 2002:a37:a52:: with SMTP id 79mr871336qkk.3.1586177448981; Mon,
 06 Apr 2020 05:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200406121233.109889-1-mst@redhat.com>
 <20200406121233.109889-3-mst@redhat.com>
In-Reply-To: <20200406121233.109889-3-mst@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 6 Apr 2020 14:50:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1nce31itwMKbmXoNZh-Y68m3GX_WwzNiaBuk280VFh-Q@mail.gmail.com>
Message-ID: <CAK8P3a1nce31itwMKbmXoNZh-Y68m3GX_WwzNiaBuk280VFh-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] vhost: disable for OABI
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Provags-ID: V03:K1:am5LAySv4VvFxx/B7HHXl1wf4zZyZF2zcEx0/gcgBNi/0NmHvOw
 qZ6PZ9cttkyzjA/yM55OWArKskRlReQzwMsp/ABmSzG6NwjbYuX0JrRD0s6GPzjUsSeRQjH
 xr09pKRhhTy5sUI8qXSvqAbTMC5eYq1BweVZ8j2UsLTbzn0RyE8MlYwSprz+Tz019cyCaYQ
 ggyP6hOFjruZWi/58M6WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EvMVpOCwI7s=:q1++TCSVpX9V8CXl5CG2QL
 t9aG+R+XQBzeyjO0H2MMVlyvLSVRemhpdXEvw/ZLXUpjooBz55SbYlhVQvggvOOtpnAHOVvSK
 dXzmau8yCLHciRalsnPbASQCa6xQjrqId8unRmao1JYNBeVVAZSP9Odlp93zVt/mGGJxdAH3M
 dBvzhAkRuyqGzM0sgaxQvdnsiDiO/8WsvTjmg+LCIcAisUKeVvr2NU0XfWs45X8Hhk+9vhHym
 2R3dLDYRa7qvorYRubaGCkqT0LJn2idU3xxy0KIgtpfPJjgqgu+D1scdYcjuBdIN1YwJBySqn
 crrGRpkZgj7kFZV32Pf+yVZCiRp98RR5zQ8RjsIw2g/hS2Cr3C6DiwmKGf7hN1GVp6VB0fX6Q
 TsaoKHu8rNBuYbNv2ej6dUwrSSs5XxT7Z0HrPj187FLXWWdic1HxhPSguXUIc6UC5aG3YuLHm
 BwnpJ3Wf2uvKbpN8d4ui2OzYcdKVwbOj0Owvr2Fej8FGPO5y53civdZQAe1EnG24elTC6TI61
 bVhgCRPlu5VZnw7y86Vy8zXW6KYK+VgeLRiJ17PK48tC72c+jrvY7eeYC5qev4rTqu8SVakqE
 ZNTmDkpq1me8vTSEKVNOiTDpww8HqpjL+g8NOLvZ6Bzt+DRn4zSnjr1Q/Ns2uGub+Pg0ILgNL
 HzlN0xIqUQnUeG0+R2LpAwITu/hzE5pcjq1fKMqfTPr2D6RjwHIJNyL/d6jnxoFetnZUKDY19
 /ypf5/tHtyT2831oBiuR0UkJ9u0bBjj07XLzUL5XqXoIPLb64b3KAjoFB0a47H97KjiL9sXKo
 l42zZeYf7Ii6DhqpjQvkv6b4S56ji9XAnI42zohebUZD0oT40k=
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

On Mon, Apr 6, 2020 at 2:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:

>
> +config VHOST_DPN
> +       bool "VHOST dependencies"
> +       depends on !ARM || AEABI
> +       default y
> +       help
> +         Anything selecting VHOST or VHOST_RING must depend on VHOST_DPN.
> +         This excludes the deprecated ARM ABI since that forces a 4 byte
> +         alignment on all structs - incompatible with virtio spec requirements.
> +

This should not be a user-visible option, so just make this 'def_bool
!ARM || AEABI'

      Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
