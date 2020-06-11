Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D4A1F66B5
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:33:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBA06895BA;
	Thu, 11 Jun 2020 11:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzNCQl3TzlAS; Thu, 11 Jun 2020 11:33:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F24FE895C1;
	Thu, 11 Jun 2020 11:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3123C0894;
	Thu, 11 Jun 2020 11:33:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A36FC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 809D5204E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zu5RyHqNzdfX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:33:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 17CE220409
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WfJS7MFBfhpSfT92H5Xzf5630oX/SV35fbP14C0fT/M=;
 b=eQPYi7fuZSEy4J9ANd+g4vQiqWUNMaZaCrpnLoMmAlSI4BIORO2Kdi1U+U7Gk9WCgMBwdc
 HcZ9m6QuBkEhiPW3aBDVwzKWJ1GX1JKJ7q8OBZYxqB9pgo1Ch0gROOFfYifwp/1U3Xqe+6
 ejktCJakH1YYoizqNukbrvZvXsFCE44=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-40aBnn6EPfGihlme-dYfFw-1; Thu, 11 Jun 2020 07:33:07 -0400
X-MC-Unique: 40aBnn6EPfGihlme-dYfFw-1
Received: by mail-wr1-f69.google.com with SMTP id s7so2448726wrm.16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=2dIQ6RqotB/k3O/m27HZrFUYODkeA8BdBJOrJFzbkOQ=;
 b=shs3A1O54H2KPv3jJi6uf08tqi1FOUnHHYIsLeuidG8K8SUjE5lzCdB1i665UMVhNR
 t7LOWmYMwTytJ+HKqZRgqHzz4v9SH7yDHUCmj6/hT3qbYGmwdbZ8BxYAbYi95BJ1WVGE
 UW7s9hMJD2Xev8YO5UTFVfx9kJuK5bWUC3HDeuIsI0wL6cMAYu+KrHwsYU4VBCh1uBaX
 vXlIpGO1ufhPTgImAlgwT4Z8XpaYk8EiiOClru2CRI0qjwhbTHXneuPJIe5PUHBCD0ST
 JdzIFq5KcumvLP3d7Z2XTlnImLnxbESz1Vx1sM1WX5UcUhM6RMC8CDeWsGqD8+7uSdu0
 OslA==
X-Gm-Message-State: AOAM532MMTaU4sUgOxCIusY9/WXDENHgePZ68CdoQ9DMklG9YOkuifNx
 fPHtx6uFGpEH455KhUWq0J0tVFJKVgAN0Rb3QGNAzgPIA48TXKTuQCFVbgpONKPTeJLY5kmbVIc
 sxcXXi0aAqxSlnS+MK9HOnhURNGJW/aQvyciy6K/PkQ==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr7761449wma.139.1591875186244; 
 Thu, 11 Jun 2020 04:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzITmqYJue/6h7gE6EEmJk49t3YKpLGBtczqqyWVB6G8GeCFtE8WXdsatoDXXqRHe8AN7iMpA==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr7761420wma.139.1591875185963; 
 Thu, 11 Jun 2020 04:33:05 -0700 (PDT)
Received: from ?IPv6:2a01:598:b907:8575:cdbd:bd6:4dce:9256?
 ([2a01:598:b907:8575:cdbd:bd6:4dce:9256])
 by smtp.gmail.com with ESMTPSA id w1sm3728533wmi.13.2020.06.11.04.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 04:33:05 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1] virtio-mem: add memory via add_memory_driver_managed()
Date: Thu, 11 Jun 2020 13:33:04 +0200
Message-Id: <613382D2-5F4D-4A32-AC8E-E1D03240036F@redhat.com>
References: <20200611071744-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200611071744-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: iPhone Mail (17E262)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 teawater <teawaterz@linux.alibaba.com>
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
Content-Type: multipart/mixed; boundary="===============6904027750206013096=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============6904027750206013096==
Content-Type: multipart/alternative; boundary=Apple-Mail-3BDDA998-C2BD-49D8-8575-72FA81B00AAD

--Apple-Mail-3BDDA998-C2BD-49D8-8575-72FA81B00AAD
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Am 11.06.2020 um 13:18 schrieb Michael S. Tsirkin <mst@redhat.com>:
>=20
> =EF=BB=BFOn Thu, Jun 11, 2020 at 01:00:24PM +0200, David Hildenbrand wrot=
e:
>>>> I'd like to have this patch in 5.8, with the initial merge of virtio-m=
em
>>>> if possible (so the user space representation of virtio-mem added memo=
ry
>>>> resources won't change anymore).
>>>=20
>>> So my plan is to rebase on top of -rc1 and merge this for rc2 then.
>>> I don't like rebase on top of tip as the results are sometimes kind of
>>> random.
>>=20
>> Right, I just wanted to get this out early so we can discuss how to proc=
eed.
>>=20
>>> And let's add a Fixes: tag as well, this way people will remember to
>>> pick this.
>>> Makes sense?
>>=20
>> Yes, it's somehow a fix (for kexec). So
>>=20
>> Fixes: 5f1f79bbc9e26 ("virtio-mem: Paravirtualized memory hotplug")
>>=20
>> I can respin after -rc1 with the commit id fixed as noted by Pankaj.
>> Just let me know what you prefer.
>>=20
>> Thanks!
>=20
> Some once this commit is in Linus' tree, please ping me.

It already is as mentioned, only the id was wrong.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3D7b7b27214bba1966772f9213cd2d8e5d67f8487f

>=20
>> --=20
>> Thanks,
>>=20
>> David / dhildenb
>=20

--Apple-Mail-3BDDA998-C2BD-49D8-8575-72FA81B00AAD
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><br></div><div dir=3D"=
ltr"><br><blockquote type=3D"cite">Am 11.06.2020 um 13:18 schrieb Michael S=
. Tsirkin &lt;mst@redhat.com&gt;:<br><br></blockquote></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Thu, Jun 11, 2020 at 01:00:24=
PM +0200, David Hildenbrand wrote:</span><br><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>I'd like to have this=
 patch in 5.8, with the initial merge of virtio-mem</span><br></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>if possible (so the user space represent=
ation of virtio-mem added memory</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>resources won't change anymore).</span><br></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span></span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>So my plan is to rebase on top of -rc1 and merge =
this for rc2 then.</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>I don't like rebase on top of tip as =
the results are sometimes kind of</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>random.</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><span></span><br></blockquo=
te><blockquote type=3D"cite"><span>Right, I just wanted to get this out ear=
ly so we can discuss how to proceed.</span><br></blockquote><blockquote typ=
e=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>And let's add a Fixes: tag as well, this way people=
 will remember to</span><br></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>pick this.</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Makes se=
nse?</span><br></blockquote></blockquote><blockquote type=3D"cite"><span></=
span><br></blockquote><blockquote type=3D"cite"><span>Yes, it's somehow a f=
ix (for kexec). So</span><br></blockquote><blockquote type=3D"cite"><span><=
/span><br></blockquote><blockquote type=3D"cite"><span>Fixes: 5f1f79bbc9e26=
 ("virtio-mem: Paravirtualized memory hotplug")</span><br></blockquote><blo=
ckquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>I can respin after -rc1 with the commit id fixed as noted by Panka=
j.</span><br></blockquote><blockquote type=3D"cite"><span>Just let me know =
what you prefer.</span><br></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>Thanks!</span><br></bl=
ockquote><span></span><br><span>Some once this commit is in Linus' tree, pl=
ease ping me.</span><br></div></blockquote><div><br></div><div>It already i=
s as mentioned, only the id was wrong.</div><div><br></div><div><a href=3D"=
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3D7b7b27214bba1966772f9213cd2d8e5d67f8487f">https://git.kernel.org/pub/=
scm/linux/kernel/git/next/linux-next.git/commit/?id=3D7b7b27214bba1966772f9=
213cd2d8e5d67f8487f</a></div><br><blockquote type=3D"cite"><div dir=3D"ltr"=
><span></span><br><blockquote type=3D"cite"><span>-- </span><br></blockquot=
e><blockquote type=3D"cite"><span>Thanks,</span><br></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><sp=
an>David / dhildenb</span><br></blockquote><span></span><br></div></blockqu=
ote></body></html>
--Apple-Mail-3BDDA998-C2BD-49D8-8575-72FA81B00AAD--


--===============6904027750206013096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6904027750206013096==--

