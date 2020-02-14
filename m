Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7415F89F
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 22:17:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DE7D86FCD;
	Fri, 14 Feb 2020 21:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F30hbnboLXWg; Fri, 14 Feb 2020 21:17:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B20AC87A30;
	Fri, 14 Feb 2020 21:17:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ABEAC0177;
	Fri, 14 Feb 2020 21:17:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D8B6C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5BB9A86A9A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WS9ThhHt9P3w
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 21:17:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7AB7D86A6F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581715054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIyCW7zKNw4xQz3WqLJf4QuolkhWBkLalV9uLdQCiZU=;
 b=LZa4JtydhJI6PwTODU5ilqMXH6JjW2bgfUJPyvZ6h/NSQyf/gjwgzzdpOItn+ZyrbPrWwp
 51vIUOZ+Opf027jDJGXllc0NNQEkdAVGo/GY4lDxZZdWeawUJMwwiQeTQI6w/0+6vadfBq
 xrpDXQVkGb8gykeEzEQKLL9xpJkhPK0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-UjVRkDL2Pf2tVGb8Rx6vCg-1; Fri, 14 Feb 2020 16:17:30 -0500
Received: by mail-wm1-f71.google.com with SMTP id z7so4561873wmi.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=8S+GOpa1A+0MD24EyXQTdphhQgGOn0hslOKo9Y8nPXo=;
 b=Jsmyu9zAXhurpw43khPtPofJlc8lmGxaApT3uWONf6IM4q9jdmKnJjGF09IDANCC1n
 HkaoHgZUOoc3wzwzotE7fHYLOcoL5IwJZARBJMA/KeO0bDO+eFlxBUhXUCQ/+EDhMtQQ
 yMcOBOvL2mugbR5QsTnwzQF9FWZ+4a5kmW69R+NoNRu7PhHkhHoObNbx2KwVb8BgqDZn
 Zh7sXQDDGyxlyheYeV6n15DUo09Pp+K8iqWtmUBVLn3WyE7jXJvpuDglYqI11Kzef6yq
 yU4VJNxdazElzvhb6AG1CiUMkg8hDgArfh0igNLvN5UtDDHKPhY7glKX72VTTSebFfiA
 1I2Q==
X-Gm-Message-State: APjAAAUN3nCmpfS+PCs10K9/DUIFa223adutHmKrsPgAN4gTo/7ojs8B
 +5r/64Vd+zNQSLIQNEnvieRMx2VbDDKac62QbbWkTWl8Bzrx1Lx4fk+fKB2G0hn48FepPQuBK/7
 TNakQbKv9C5Ql2wCN7S/79PCuqKhOiNCtJjHCx6Jy/g==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr5842745wrx.336.1581715048460; 
 Fri, 14 Feb 2020 13:17:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAFrrrXOOLa3jDTBBdR9kW945eP5FH1XSlZWkSxfRxXSKyTgPz3QKoY5/FDAD6aW6U/sc0VQ==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr5842726wrx.336.1581715048175; 
 Fri, 14 Feb 2020 13:17:28 -0800 (PST)
Received: from [192.168.3.122] (p5B0C6A45.dip0.t-ipconnect.de. [91.12.106.69])
 by smtp.gmail.com with ESMTPSA id
 s22sm8652442wmh.4.2020.02.14.13.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 13:17:27 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Date: Fri, 14 Feb 2020 22:17:26 +0100
Message-Id: <8B1B3CD6-10D5-46D3-B8E5-A6AD0B8E41BC@redhat.com>
References: <CAJuQAmpGKcyWo8Ojnia_pXZAaOt98u0c_Sk-8ieCO218hutW1g@mail.gmail.com>
In-Reply-To: <CAJuQAmpGKcyWo8Ojnia_pXZAaOt98u0c_Sk-8ieCO218hutW1g@mail.gmail.com>
To: Tyler Sanderson <tysand@google.com>
X-Mailer: iPhone Mail (17D50)
X-MC-Unique: UjVRkDL2Pf2tVGb8Rx6vCg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============0044154316470416689=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0044154316470416689==
Content-Type: multipart/alternative; boundary=Apple-Mail-3738AA56-3B37-4F6D-A815-7B956B2B47A0

--Apple-Mail-3738AA56-3B37-4F6D-A815-7B956B2B47A0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Am 14.02.2020 um 21:49 schrieb Tyler Sanderson <tysand@google.com>:
>=20
> =EF=BB=BF
> Regarding Wei's patch that modifies the shrinker implementation, versus t=
his patch which reverts to OOM notifier:
> I am in favor of both patches. But I do want to make sure a fix gets back=
 ported to 4.19 where the performance regression was first introduced.
> My concern with reverting to the OOM notifier is, as mst@ put it (in the =
other thread):
> "when linux hits OOM all kind of error paths are being hit, latent bugs s=
tart triggering, latency goes up drastically."

Yeah, and that was the default behavior for years, so it=E2=80=98s not big =
news :)

> The guest could be in a lot of pain before the OOM notifier is invoked, a=
nd it seems like the shrinker API might allow more fine grained control of =
when we deflate.
>=20
> On the other hand, I'm not totally convinced that Wei's patch is an expec=
ted use of the shrinker/page-cache APIs, and maybe it is fragile. Needs mor=
e testing and scrutiny.
>=20
> It seems to me like the shrinker API is the right API in the long run, pe=
rhaps with some fixes and modifications. But maybe reverting to OOM notifie=
r is the best patch to back

I think that=E2=80=98s a good idea. Revert to the old state we had for year=
s and then implement a proper, fully tested solution (e.g., shrinkers with =
priorities).

Cheers!
--Apple-Mail-3738AA56-3B37-4F6D-A815-7B956B2B47A0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><br></div><div dir=3D"=
ltr"><br><blockquote type=3D"cite">Am 14.02.2020 um 21:49 schrieb Tyler San=
derson &lt;tysand@google.com&gt;:<br><br></blockquote></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div>Regarding Wei's =
patch that modifies the shrinker implementation, versus this patch which re=
verts to OOM notifier:</div><div>I am in favor of both patches. But I do wa=
nt to make sure a fix gets back ported to 4.19 where the performance regres=
sion was first introduced.</div><div>My concern with reverting to the OOM n=
otifier is, as mst@ put it (in the other thread):<br><span style=3D"color:r=
gb(80,0,80)">"when linux hits OOM&nbsp;</span><span style=3D"color:rgb(80,0=
,80)">all kind of error paths are being hit, latent bugs start triggering,&=
nbsp;</span><span style=3D"color:rgb(80,0,80)">latency goes up drastically.=
"</span><br></div></div></div></blockquote><div><br></div><div>Yeah, and th=
at was the default behavior for years, so it=E2=80=98s not big news :)</div=
><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div>The g=
uest could be in a lot of pain before the OOM notifier is invoked, and it s=
eems like the shrinker API might allow more fine grained control of when we=
 deflate.</div><div><br></div><div>On the other hand, I'm not totally convi=
nced that Wei's patch is an expected use of the shrinker/page-cache APIs, a=
nd maybe it is fragile. Needs more testing&nbsp;and scrutiny.</div><div><br=
></div><div>It seems to me like the shrinker API is the right API in the lo=
ng run, perhaps with some fixes and modifications. But maybe reverting to O=
OM notifier is the best patch to back</div></div></div></blockquote><br><di=
v>I think that=E2=80=98s a good idea. Revert to the old state we had for ye=
ars and then implement a proper, fully tested solution (e.g., shrinkers wit=
h priorities).</div><div><br></div><div>Cheers!</div></body></html>
--Apple-Mail-3738AA56-3B37-4F6D-A815-7B956B2B47A0--


--===============0044154316470416689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0044154316470416689==--

