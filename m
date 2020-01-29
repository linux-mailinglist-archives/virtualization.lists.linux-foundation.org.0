Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C231714C3EA
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 01:22:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D168E85749;
	Wed, 29 Jan 2020 00:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUleZbWSmsIv; Wed, 29 Jan 2020 00:22:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24A28854D1;
	Wed, 29 Jan 2020 00:22:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17D86C0171;
	Wed, 29 Jan 2020 00:22:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7B9BC0171
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 00:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A306F854D1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 00:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPjSLqHtK7WI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 00:22:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D74B4853D0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 00:22:24 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id y3so5555710uae.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jan 2020 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8HtRdwgGcH4f6Z/lVF6vFA59Tr/oWDrO661rNET95Oc=;
 b=ulI2cc5kQ+c5OxZZsGv6+S62z9uLdlwI8wSLVLN7Z7ALmXn+IjpRUXBW45uHSoUmHr
 ZsWstgmb6YZgO2L6q5Zf8zwMZVFqVp95Dp6UoSjwnkW8wNLmfD0WqrtCIsv+EgU3vAus
 x/LA0lpHiKcHYgAMmZm3SNZpKzI+eD2rMRWiAeaUrq9ClL60UXSuzaHNPWj0JEX9CIWF
 kbDWhsR47LEFXpvHdRGvv7EYTU8FINarvKKo1R2TvxfxxOs0PqJjdiVHe97Qiqv4UMbD
 tdlcMJTwV/SPZI+Ixt9xHsiaixBKryJOaSBfoUo/BZfG+O5qLzjMqPuigqwu8/900taf
 /c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8HtRdwgGcH4f6Z/lVF6vFA59Tr/oWDrO661rNET95Oc=;
 b=c17gL7wOF285tcW0U/tAUOHCW6mVuDZ2YBXY7tokK+pkrvT8ghYW6iic2L1rTVFPnL
 +a/QdeTx87mV4R8V4zJehKSPVWrBbvicBh1YwZvmpaso2HMXAjY22triddLjvdNqBhg2
 RpPn3GEcc8gS07UMDL215NVT2dXO3C5Cy9zibqEnVLTYhxL9Hifg5WhubsBBu6Srkw5K
 r30fsBqkov+TEjiWSCDdMS6HU5Lwp8PIznh+FL/Gou/yX1SqerLLw+ssSHBdbAiec1ZX
 UBXTkrvNJzfoduKy1Iac+Sxdb9eJnUzl3dNOj/GGo0apCkgOY3VLRjiBqucoisirTy/5
 II4g==
X-Gm-Message-State: APjAAAVMATYje3TrGOXQnKCaqKTDYI6Ob0VgEjTelFyHyWseh4aVmGPy
 hi6zpBBWwMu4wSdqin24lP4iF0kwPZ5Q5a39Oj4iOOvn
X-Google-Smtp-Source: APXvYqxmzMawLeI/DIW3UHTJsWClXdetE2aCCeHRRAluBOB/MdC+QRGZjZ9n251WxrYcqGhS/RnCCrz3lkq+bxxE/yQ=
X-Received: by 2002:ab0:e07:: with SMTP id g7mr14419563uak.59.1580257343349;
 Tue, 28 Jan 2020 16:22:23 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 28 Jan 2020 16:22:12 -0800
Message-ID: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
Subject: Balloon pressuring page cache
To: virtualization@lists.linux-foundation.org, Wei Wang <wei.w.wang@intel.com>,
 David Rientjes <rientjes@google.com>
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
From: Tyler Sanderson via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Tyler Sanderson <tysand@google.com>
Content-Type: multipart/mixed; boundary="===============1922392908477810118=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============1922392908477810118==
Content-Type: multipart/alternative; boundary="0000000000009b286c059d3c55f7"

--0000000000009b286c059d3c55f7
Content-Type: text/plain; charset="UTF-8"

A primary advantage of virtio balloon over other memory reclaim mechanisms
is that it can pressure the guest's page cache into shrinking.

However, since the balloon driver changed to using the shrinker API
<https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9>
this
use case has become a bit more tricky. I'm wondering what the intended
device implementation is.

When inflating the balloon against page cache (i.e. no free memory remains)
vmscan.c will both shrink page cache, but also invoke the shrinkers --
including the balloon's shrinker. So the balloon driver allocates memory
which requires reclaim, vmscan gets this memory by shrinking the balloon,
and then the driver adds the memory back to the balloon. Basically a busy
no-op.

If file IO is ongoing during this balloon inflation then the page cache
could be growing which further puts "back pressure" on the balloon trying
to inflate. In testing I've seen periods of > 45 seconds where balloon
inflation makes no net forward progress.

This wasn't a problem before the change to the shrinker API since forced
balloon deflation only occurred via the OOM notifier callback which was
invoked only after the page cache had depleted.

Is this new busy behavior working as intended?

--0000000000009b286c059d3c55f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A primary advantage of virtio balloon over other=C2=A0memo=
ry reclaim mechanisms is that it can=C2=A0pressure the guest&#39;s page cac=
he into shrinking.<div><br></div><div>However, since the balloon driver <a =
href=3D"https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa9=
e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9" target=3D"_blank">cha=
nged to using the shrinker API</a>=C2=A0this use case has become a bit more=
 tricky. I&#39;m wondering what the intended device implementation is.</div=
><div><br></div><div>When inflating the balloon against page cache (i.e. no=
 free memory remains) vmscan.c will both shrink page cache, but also invoke=
 the shrinkers -- including the balloon&#39;s shrinker. So the balloon driv=
er allocates memory which requires reclaim, vmscan gets this memory by shri=
nking the balloon, and then the driver adds the memory back to the balloon.=
 Basically a busy no-op.</div><div><br></div><div>If file IO is ongoing dur=
ing this balloon inflation then the page cache could be growing which furth=
er puts &quot;back pressure&quot; on the balloon trying to inflate. In test=
ing I&#39;ve seen periods of &gt; 45 seconds where balloon inflation makes =
no net forward progress.</div><div><br></div><div>This wasn&#39;t a problem=
 before the change to the shrinker API since forced balloon deflation only =
occurred via the OOM notifier callback which was invoked only after the pag=
e cache had depleted.</div><div><br></div><div>Is this new busy behavior wo=
rking as intended?</div></div>

--0000000000009b286c059d3c55f7--

--===============1922392908477810118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1922392908477810118==--
