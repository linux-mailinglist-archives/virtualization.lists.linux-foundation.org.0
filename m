Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C843766
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 16:55:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B810C00;
	Thu, 13 Jun 2019 14:55:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2CE99C00
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 14:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 654D563D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 14:55:41 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e5so17554037iok.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uup4+yu3rtMc7LeujGtatwYo2KR3g+6RsZgNCQu53+s=;
	b=dRA7kkC6r7wRPZLUONW10Np1uUb8HPBolEESaREKqFHCIt9zzjww757ZoQSNpKxNPG
	hzG+r+5YOC8bst+qIvQX3Xfyd/NIpwF/n5adKAckP6Ym7vRhL/7uWyyKnoNTat0f/nX8
	B/v+24+5LtdOQuMe3NPVEv7GWNVD6MuSM5cgFFNYRNcqOc35o62b1h/fb3YhTqQe6z0Q
	sEllM3MXFo42WWWhRLZSYtLip27DXU+a86+XbEKRZKPZ6AeIzggquANG1MUxj7B8j+C8
	bQ71VSyRSSIAU26XKUD916rOfN62mouWgp1ylR8aA9k5oYDq+qMlijPdOWeDkHHL7VBU
	o5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uup4+yu3rtMc7LeujGtatwYo2KR3g+6RsZgNCQu53+s=;
	b=oV6q6OpD1v5HwNdbmu3C3qH4GKkRvMt2GUtvan8IjpAuu3ulsNbb/Pc9mN5cfgHdZd
	dl3gmzs0lDR1Rj86vl1qmq5/6MTf9TBOV8JlyTv9jGLkdzQ6GJA3CzKQJS2CD9PcfmBY
	OzqgsFvNl3p+4m+B0yegRovfkbOqgjkxw6FdfpFYygQqBhUsbqP9ptXJIhwZOzNH8oIk
	iV31I+30cxZ+gc46Z+u+O1Cx1bsvngdpjpPY4CSJ1z7X1NXCO46+SVKYQ+kLT5D8rlj9
	NJaHzGWhIbSMfSWyTyH/ibWuWKyFfDThQgqdbztpnv1NOcKaRhlOsTvqA/M5s/qiMPCP
	MMSQ==
X-Gm-Message-State: APjAAAXcuoRxjJOmjUDE4dgkckOz7McMYXiNlg9J0YaOX+mJhTdY37WW
	f35R0qTUfJ13V7JZZOCm5i0pKf16zP+wjg6SfsVA5g==
X-Google-Smtp-Source: APXvYqzndfKSRA8giBrYgV9Bq3flf7/vWqrwRTfUpglIJWfRs4WlFdnhSvBS3hk0Dee76SlakiYKGNbXkT69+kh9eqg=
X-Received: by 2002:a6b:b556:: with SMTP id e83mr46526986iof.94.1560437740323; 
	Thu, 13 Jun 2019 07:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190613141521.424-1-hdanton@sina.com>
In-Reply-To: <20190613141521.424-1-hdanton@sina.com>
Date: Thu, 13 Jun 2019 16:55:28 +0200
Message-ID: <CACT4Y+bAuAiApr9CxSH5CoDnZ5hYmU+K4kJqrSo5yBZLyrzONA@mail.gmail.com>
Subject: Re: memory leak in vhost_net_ioctl
To: Hillf Danton <hdanton@sina.com>
Content-Type: multipart/mixed; boundary="000000000000355591058b35b99c"
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	syzbot <syzbot+0789f0c7e45efd7bb643@syzkaller.appspotmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
	Asias He <asias@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Dmitry Vyukov via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--000000000000355591058b35b99c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 4:15 PM Hillf Danton <hdanton@sina.com> wrote:
>
>
> Hello Dmitry
>
> On Thu, 13 Jun 2019 20:12:06 +0800 Dmitry Vyukov wrote:
> > On Thu, Jun 13, 2019 at 2:07 PM Hillf Danton <hdanton@sina.com> wrote:
> > >
> > > Hello Jason
> > >
> > > On Thu, 13 Jun 2019 17:10:39 +0800 Jason Wang wrote:
> > > >
> > > > This is basically a kfree(ubuf) after the second vhost_net_flush() =
in
> > > > vhost_net_release().
> > > >
> > > Fairly good catch.
> > >
> > > > Could you please post a formal patch?
> > > >
> > > I'd like very much to do that; but I wont, I am afraid, until I colle=
ct a
> > > Tested-by because of reproducer without a cutting edge.
> >
> > You can easily collect Tested-by from syzbot for any bug with a reprodu=
cer;)
> > https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-=
patches
> >
> Thank you for the light you are casting.

:)

But you did not ask syzbot to test. That would be something like this
(keeping syzbot email in CC):

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

(I've attached the patch because my email client is incapable of
sending non-corrupted patches inline, but otherwise inline patches
should work too).


> Here it goes.
> --->8--------
> From: Hillf Danton <hdanton@sina.com>
> Subject: [PATCH] vhost: fix memory leak in vhost_net_release
>
> syzbot found the following crash on:
>
> HEAD commit:    788a0249 Merge tag 'arc-5.2-rc4' of git://git.kernel.org/=
p..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x dc9ea6a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=C3=95c73825cbdc=
7326
> dashboard link: https://syzkaller.appspot.com/bug?extid 89f0c7e45efd7bb64=
3
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x b31761a00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x 4892c1a00000
>
>
> udit: type 00 audit(1559768703.229:36): avc:  denied  { map } for
> pidq16 comm=3D"syz-executor330" path=3D"/root/syz-executor330334897"
> dev=3D"sda1" ino 461 scontext=3Dunconfined_u:system_r:insmod_t:s0-s0:c0.c=
1023
> tcontext=3Dunconfined_u:object_r:user_home_t:s0 tclass=3Dfile permissive=
=3D1
> executing program
> executing program
>
> BUG: memory leak
> unreferenced object 0xffff88812421fe40 (size 64):
>    comm "syz-executor330", pid 7117, jiffies 4294949245 (age 13.030s)
>    hex dump (first 32 bytes):
>      01 00 00 00 20 69 6f 63 00 00 00 00 64 65 76 2f  .... ioc....dev/
>      50 fe 21 24 81 88 ff ff 50 fe 21 24 81 88 ff ff  P.!$....P.!$....
>    backtrace:
>      [<00000000ae0c4ae0>] kmemleak_alloc_recursive include/linux/kmemleak=
.h:55 [inline]
>      [<00000000ae0c4ae0>] slab_post_alloc_hook mm/slab.h:439 [inline]
>      [<00000000ae0c4ae0>] slab_alloc mm/slab.c:3326 [inline]
>      [<00000000ae0c4ae0>] kmem_cache_alloc_trace+0x13d/0x280 mm/slab.c:35=
53
>      [<0000000079ebab38>] kmalloc include/linux/slab.h:547 [inline]
>      [<0000000079ebab38>] vhost_net_ubuf_alloc drivers/vhost/net.c:241 [i=
nline]
>      [<0000000079ebab38>] vhost_net_set_backend drivers/vhost/net.c:1534 =
[inline]
>      [<0000000079ebab38>] vhost_net_ioctl+0xb43/0xc10 drivers/vhost/net.c=
:1716
>      [<000000009f6204a2>] vfs_ioctl fs/ioctl.c:46 [inline]
>      [<000000009f6204a2>] file_ioctl fs/ioctl.c:509 [inline]
>      [<000000009f6204a2>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
>      [<00000000b45866de>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
>      [<00000000dfb41eb8>] __do_sys_ioctl fs/ioctl.c:720 [inline]
>      [<00000000dfb41eb8>] __se_sys_ioctl fs/ioctl.c:718 [inline]
>      [<00000000dfb41eb8>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
>      [<0000000049c1f547>] do_syscall_64+0x76/0x1a0 arch/x86/entry/common.=
c:301
>      [<0000000029cc8ca7>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> BUG: memory leak
> unreferenced object 0xffff88812421fa80 (size 64):
>    comm "syz-executor330", pid 7130, jiffies 4294949755 (age 7.930s)
>    hex dump (first 32 bytes):
>      01 00 00 00 01 00 00 00 00 00 00 00 2f 76 69 72  ............/vir
>      90 fa 21 24 81 88 ff ff 90 fa 21 24 81 88 ff ff  ..!$......!$....
>    backtrace:
>      [<00000000ae0c4ae0>] kmemleak_alloc_recursive  include/linux/kmemlea=
k.h:55 [inline]
>      [<00000000ae0c4ae0>] slab_post_alloc_hook mm/slab.h:439 [inline]
>      [<00000000ae0c4ae0>] slab_alloc mm/slab.c:3326 [inline]
>      [<00000000ae0c4ae0>] kmem_cache_alloc_trace+0x13d/0x280 mm/slab.c:35=
53
>      [<0000000079ebab38>] kmalloc include/linux/slab.h:547 [inline]
>      [<0000000079ebab38>] vhost_net_ubuf_alloc drivers/vhost/net.c:241  [=
inline]
>      [<0000000079ebab38>] vhost_net_set_backend drivers/vhost/net.c:1534 =
 [inline]
>      [<0000000079ebab38>] vhost_net_ioctl+0xb43/0xc10  drivers/vhost/net.=
c:1716
>      [<000000009f6204a2>] vfs_ioctl fs/ioctl.c:46 [inline]
>      [<000000009f6204a2>] file_ioctl fs/ioctl.c:509 [inline]
>      [<000000009f6204a2>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
>      [<00000000b45866de>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
>      [<00000000dfb41eb8>] __do_sys_ioctl fs/ioctl.c:720 [inline]
>      [<00000000dfb41eb8>] __se_sys_ioctl fs/ioctl.c:718 [inline]
>      [<00000000dfb41eb8>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
>      [<0000000049c1f547>] do_syscall_64+0x76/0x1a0  arch/x86/entry/common=
.c:301
>      [<0000000029cc8ca7>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> End of syzbot report.
>
> The function vhost_net_ubuf_alloc() appears in the two cases of dump info=
, for
> pid 7130 and 7117, suggesting that it is ubuf leak.
>
> Since commit c38e39c378f4 ("vhost-net: fix use-after-free in vhost_net_fl=
ush")
> the function vhost_net_flush() had been no longer releasing ubuf.
>
> Freeing the slab after the last flush in the release path fixes it.
>
>
> Fixes: c38e39c378f4 ("vhost-net: fix use-after-free in vhost_net_flush")
> Reported-by: Syzbot <syzbot+0789f0c7e45efd7bb643@syzkaller.appspotmail.co=
m>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Asias He <asias@redhat.com>
> Signed-off-by: Hillf Danton <hdanton@sina.com>
> ---
> This is sent only for collecting Tested-by.
>
>  drivers/vhost/net.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 3beb401..22fae0a 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -1404,6 +1404,7 @@ static int vhost_net_release(struct inode *inode, s=
truct file *f)
>         /* We do an extra flush before freeing memory,
>          * since jobs can re-queue themselves. */
>         vhost_net_flush(n);
> +       kfree(n->vqs[VHOST_NET_VQ_TX].ubufs);
>         kfree(n->vqs[VHOST_NET_VQ_RX].rxq.queue);
>         kfree(n->vqs[VHOST_NET_VQ_TX].xdp);
>         kfree(n->dev.vqs);
> --
>

--000000000000355591058b35b99c
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_jwus9oj40>
X-Attachment-Id: f_jwus9oj40

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvbmV0LmMgYi9kcml2ZXJzL3Zob3N0L25ldC5jCmlu
ZGV4IDNiZWI0MDEuLjIyZmFlMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmhvc3QvbmV0LmMKKysr
IGIvZHJpdmVycy92aG9zdC9uZXQuYwpAQCAtMTQwNCw2ICsxNDA0LDcgQEAgc3RhdGljIGludCB2
aG9zdF9uZXRfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKIAkv
KiBXZSBkbyBhbiBleHRyYSBmbHVzaCBiZWZvcmUgZnJlZWluZyBtZW1vcnksCiAJICogc2luY2Ug
am9icyBjYW4gcmUtcXVldWUgdGhlbXNlbHZlcy4gKi8KIAl2aG9zdF9uZXRfZmx1c2gobik7CisJ
a2ZyZWUobi0+dnFzW1ZIT1NUX05FVF9WUV9UWF0udWJ1ZnMpOwogCWtmcmVlKG4tPnZxc1tWSE9T
VF9ORVRfVlFfUlhdLnJ4cS5xdWV1ZSk7CiAJa2ZyZWUobi0+dnFzW1ZIT1NUX05FVF9WUV9UWF0u
eGRwKTsKIAlrZnJlZShuLT5kZXYudnFzKTsKLS0K
--000000000000355591058b35b99c
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--000000000000355591058b35b99c--
