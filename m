Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14F345AE5
	for <lists.virtualization@lfdr.de>; Tue, 23 Mar 2021 10:33:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E9A54036B;
	Tue, 23 Mar 2021 09:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9w5K_J2rrqh; Tue, 23 Mar 2021 09:33:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30E944036E;
	Tue, 23 Mar 2021 09:33:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACC39C0001;
	Tue, 23 Mar 2021 09:33:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6E83C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 09:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3370404A4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 09:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLGdXz_vakap
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 09:33:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0208E404A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 09:33:24 +0000 (UTC)
Received: from mail-oi1-f177.google.com ([209.85.167.177]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuDsZ-1lenGk0aY1-00uZYr for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 10:28:15 +0100
Received: by mail-oi1-f177.google.com with SMTP id i3so16301454oik.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 02:28:14 -0700 (PDT)
X-Gm-Message-State: AOAM532cbusJAZz0D4S5P3cIHAyfhMEHyFDdvz6Wlb86UqEx/usixgwC
 alhCrvdzf6kYDWRiaebcOeOKe8L54tIl1O58jcE=
X-Google-Smtp-Source: ABdhPJyawnqd0rPTfMgWQN81x6KOuu3+lmy+fOx7JqHwDIybakw6kdseTvKueo+vyCC0bOoWLnxxhWHxrRhczxkY/TI=
X-Received: by 2002:a05:6808:313:: with SMTP id
 i19mr2540633oie.67.1616491693900; 
 Tue, 23 Mar 2021 02:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
In-Reply-To: <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 23 Mar 2021 10:27:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
Message-ID: <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To: Jie Deng <jie.deng@intel.com>
X-Provags-ID: V03:K1:GXfeBFtgFgTKSQasMkKq9Aqe+g84RPEUS1+VQvSzuIPtvL4dA2h
 zWxEa/+eAD6HF9/XCuzfzEcWMgwhRoWsJH5gRo/G8b0fPkoXbAjkTy2ye54EztaKbtICFbF
 szuK/xYsLN6goX//uz3n/ownEuzAwuW7ERW2lItxmE96lWR0VFjOoZJC4NTR8GcYbPLk6x2
 f3c+2mD7EoPkc2ht69dTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cw8TVM5GhOg=:flbDi/KMTYHF3HvgfSPLce
 onISSxygQvXUMDxH2hizPTVf2JXSWoMX6ZdAjtrw0YHjnE5zIntCccv4B1ldXyAYLF1PlxT3H
 iyrMzrjaWorRsZGS4NPh8Vju9FQrT0FWB/Fwjq2KElE9Xu/bgG5gdMgIWbJCCoN6eadX2S+aS
 YyIPqvlAUjzTnRe2eBBtpN3ozr9d4vlsJbA3TJLftrSgE5ag9uz7GI6+YykTZz5s+Sn/hKLRb
 Q0Z1woY4aqyvYfiaMHbJHeTLD8/vWR0Z0WF8YH3YiCubIGgApj1lJF4PADMoW58lh3lL3TBdD
 irEXGCsucWHvK0hEz00NrLTnz3dtA1qPD7ANLpHsg7cYz2Jtrk4JQd/DxYWJ198oCzb55jZX7
 8KSNCdwCr8GuAPhjLyKnhx/f06E2/QOlysM75bQBzNND1/mYD8g4UAx2x3AIWv3X3hsRITBoN
 yO52LicdzobIw2n5Or3LfYOI5YIN6SRiPdMx2EhjQqCys7t1IaMJ3yUrIaqSBvcPu5s+iAhRA
 i2lwcAuXo2jBRcfG1cs1HG2ApImZrRP17Xrtoj8Wequ3lL1CM/5G2ZITW3GPb7D0Q==
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, yu1.wang@intel.com,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 kblaiech@mellanox.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Tali Perry <tali.perry1@gmail.com>,
 conghui.chen@intel.com, loic.poulain@linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
 jarkko.nikula@linux.intel.com, shuo.a.liu@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>
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

On Tue, Mar 23, 2021 at 9:33 AM Jie Deng <jie.deng@intel.com> wrote:
>
> On 2021/3/23 15:27, Viresh Kumar wrote:
>
> > On 23-03-21, 22:19, Jie Deng wrote:
> >> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
> >> +{
> >> +    virtio_i2c_del_vqs(vdev);
> >> +    return 0;
> >> +}
> >> +
> >> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
> >> +{
> >> +    return virtio_i2c_setup_vqs(vdev->priv);
> >> +}
> > Sorry for not looking at this earlier, but shouldn't we enclose the above two
> > within #ifdef CONFIG_PM_SLEEP instead and drop the __maybe_unused ?
>
>
> I remembered I was suggested to use "__maybe_unused" instead of "#ifdef".
>
> You may check this https://lore.kernel.org/patchwork/patch/732981/
>
> The reason may be something like that.

I usually recommend the use of __maybe_unused for the suspend/resume
callbacks for drivers that use SIMPLE_DEV_PM_OPS() or similar helpers
that hide the exact conditions under which the functions get called.

In this driver, there is an explicit #ifdef in the reference to the
functions, so
it would make sense to use the same #ifdef around the definition.

A better question to ask is whether you could use the helpers instead,
and drop the other #ifdef.

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
