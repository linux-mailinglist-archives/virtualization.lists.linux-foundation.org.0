Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18E11BE78
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 21:49:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C00987C8B;
	Wed, 11 Dec 2019 20:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBd3nepaJluP; Wed, 11 Dec 2019 20:49:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 025BD87EAD;
	Wed, 11 Dec 2019 20:49:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2E44C0881;
	Wed, 11 Dec 2019 20:49:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 027C4C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F08AB86D19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4hm_QidPNix
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:49:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 505788354A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:49:37 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M42b8-1if8um20TA-0005Wv; Wed, 11 Dec 2019 21:48:56 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Jens Axboe <axboe@kernel.dk>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Doug Gilbert <dgilbert@interlog.com>,
 =?UTF-8?q?Kai=20M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Subject: [PATCH 15/24] compat_ioctl: scsi: move ioctl handling into drivers
Date: Wed, 11 Dec 2019 21:42:49 +0100
Message-Id: <20191211204306.1207817-16-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191211204306.1207817-1-arnd@arndb.de>
References: <20191211204306.1207817-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BaNM5i3rFNToDWp9jqn98bS6gnJlc1tUHYGa076M37t4numkmEH
 rmgMewG1Vi+BsQ/z8r6JFumNEzJhwXbkY93w78CnKNhOKnoChx4VrIkfSPo2MoO3z82l4VB
 J4KPCeRZLRCn0RIC0yEceOWO4NbMkkcX4eSx2TVmRsLJ70LxQTgVEu92Y4ycBBUW/GNlT9b
 VCNWFpOoJ+xrP9oEfE68w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U6GIxbucmvM=:2VfssZVNDAhPiU7N9HwQPZ
 PCmC7/SVP5XheKAB6Hw9XDyg+6C/vuTLprB69lkl2LruWKv7lTayTvXMmc/x63Qix9mHc2eUj
 hZQwOEvWYbFrBIozvkET+/y0P9TsC735E9LmTXywAr3yOjfz8hMoA6w5jrTidIHTH/MlF6R/l
 X35huqxBnekp87Sv73Eed2nQAGwOlVvquGQXWgb9SBd4rCMvhKdCrg2D96A8TNan3cl3YEtzf
 jrWokUNDC+CYqFL+YHp+6cYm+/4WuNoeF/6fzixpeheuc2v85u/+/QNBSa2gEtj29DGri86eT
 /wETNUAM9Yh4EWqj68xNOrdiEDgAt1RhMvHF5uEVpYbbIFhJuy19g+OdC1pLU8vVOTJ8UU3dI
 mmzRTEJDklVDi4yFDYF8T2PjwAMdgWjKLT97pOo47LYi5ohyXhU+pInkeUIMfk6kPa8X92e93
 SD1K9xWLlMCKeM8Y1DHp5c/8pR1x7lgKPsApQiZaFFfwav/igamRrpQMTB89yOOQQBM9vlFRi
 u3tioDUOgZ7snHqyDzp7b493e6kQK9gYIQ6/4RYYjcnByHyiNNlh0suiObzAcgFOTcfCK3TPa
 SJtLmB3K2HOmQp/1kkUaiTyUHeWMU5lkXAaWIT1L30+FpJH3IxYnYrhJZqVglL0OlS6BEAFKH
 04ngRIAWr9G00f2BAlnvNgObxSUUg4hbUnAKZFOW3r7nW7ZpcOQk6q5cWwsJuw+hqxXf+pzpK
 dp5cYF834e9IhpREH1CamKSH7TaALhrqE2qXxMvplAHcUX4UYrvJWzzla5in9RqDjCeRGaGr3
 PoMNxOjDo+uzozEBY9V+dW6WXEEn7bfYXO1tCogxKRg203EBa9xjS5JgtuTLlT313bVGDMz0s
 ZeB2jEMeV7pnZW2S7tpQ==
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
 Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org,
 Damien Le Moal <damien.lemoal@wdc.com>, John Garry <john.garry@huawei.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RWFjaCBkcml2ZXIgY2FsbGluZyBzY3NpX2lvY3RsKCkgZ2V0cyBhbiBlcXVpdmFsZW50IGNvbXBh
dF9pb2N0bCgpCmhhbmRsZXIgdGhhdCBpbXBsZW1lbnRzIHRoZSBzYW1lIGNvbW1hbmRzIGJ5IGNh
bGxpbmcgc2NzaV9jb21wYXRfaW9jdGwoKS4KClRoZSBzY3NpX2NtZF9pb2N0bCgpIGFuZCBzY3Np
X2NtZF9ibGtfaW9jdGwoKSBmdW5jdGlvbnMgYXJlIGNvbXBhdGlibGUKYXQgdGhpcyBwb2ludCwg
c28gYW55IGRyaXZlciB0aGF0IGNhbGxzIHRob3NlIGNhbiBkbyBzbyBmb3IgYm90aCBuYXRpdmUK
YW5kIGNvbXBhdCBtb2RlLCB3aXRoIHRoZSBhcmd1bWVudCBwYXNzZWQgdGhyb3VnaCBjb21wYXRf
cHRyKCkuCgpXaXRoIHRoaXMsIHdlIGNhbiByZW1vdmUgdGhlIGVudHJpZXMgZnJvbSBmcy9jb21w
YXRfaW9jdGwuYy4gIFRoZSBuZXcKY29kZSBpcyBsYXJnZXIsIGJ1dCBzaG91bGQgYmUgZWFzaWVy
IHRvIG1haW50YWluIGFuZCBrZWVwIHVwZGF0ZWQgd2l0aApuZXdseSBhZGRlZCBjb21tYW5kcy4K
ClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVy
cy9ibG9jay92aXJ0aW9fYmxrLmMgfCAgIDMgKwogZHJpdmVycy9zY3NpL2NoLmMgICAgICAgICAg
fCAgIDkgKystCiBkcml2ZXJzL3Njc2kvc2QuYyAgICAgICAgICB8ICA1MCArKysrKystLS0tLS0t
LQogZHJpdmVycy9zY3NpL3NnLmMgICAgICAgICAgfCAgNDQgKysrKysrKystLS0tLQogZHJpdmVy
cy9zY3NpL3NyLmMgICAgICAgICAgfCAgNTcgKysrKysrKysrKysrKystLQogZHJpdmVycy9zY3Np
L3N0LmMgICAgICAgICAgfCAgNTEgKysrKysrKystLS0tLS0KIGZzL2NvbXBhdF9pb2N0bC5jICAg
ICAgICAgIHwgMTMyICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDcgZmls
ZXMgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKyksIDIwNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyBiL2RyaXZlcnMvYmxvY2svdmlydGlvX2Js
ay5jCmluZGV4IDdmZmQ3MTlkODlkZS4uZmJiZjE4YWMxZDVkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2Jsb2NrL3ZpcnRpb19ibGsuYworKysgYi9kcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYwpAQCAt
NDA1LDYgKzQwNSw5IEBAIHN0YXRpYyBpbnQgdmlydGJsa19nZXRnZW8oc3RydWN0IGJsb2NrX2Rl
dmljZSAqYmQsIHN0cnVjdCBoZF9nZW9tZXRyeSAqZ2VvKQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGJsb2NrX2RldmljZV9vcGVyYXRpb25zIHZpcnRibGtfZm9wcyA9IHsKIAkuaW9jdGwgID0gdmly
dGJsa19pb2N0bCwKKyNpZmRlZiBDT05GSUdfQ09NUEFUCisJLmNvbXBhdF9pb2N0bCA9IGJsa2Rl
dl9jb21wYXRfcHRyX2lvY3RsLAorI2VuZGlmCiAJLm93bmVyICA9IFRISVNfTU9EVUxFLAogCS5n
ZXRnZW8gPSB2aXJ0YmxrX2dldGdlbywKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvY2gu
YyBiL2RyaXZlcnMvc2NzaS9jaC5jCmluZGV4IDc2NzUxZDZjN2YwZC4uZWQ1ZjRhNmFlMjcwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3Njc2kvY2guYworKysgYi9kcml2ZXJzL3Njc2kvY2guYwpAQCAt
ODcyLDYgKzg3MiwxMCBAQCBzdGF0aWMgbG9uZyBjaF9pb2N0bF9jb21wYXQoc3RydWN0IGZpbGUg
KiBmaWxlLAogCQkJICAgIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQogewog
CXNjc2lfY2hhbmdlciAqY2ggPSBmaWxlLT5wcml2YXRlX2RhdGE7CisJaW50IHJldHZhbCA9IHNj
c2lfaW9jdGxfYmxvY2tfd2hlbl9wcm9jZXNzaW5nX2Vycm9ycyhjaC0+ZGV2aWNlLCBjbWQsCisJ
CQkJCQkJZmlsZS0+Zl9mbGFncyAmIE9fTkRFTEFZKTsKKwlpZiAocmV0dmFsKQorCQlyZXR1cm4g
cmV0dmFsOwogCiAJc3dpdGNoIChjbWQpIHsKIAljYXNlIENISU9HUEFSQU1TOgpAQCAtODgzLDcg
Kzg4Nyw3IEBAIHN0YXRpYyBsb25nIGNoX2lvY3RsX2NvbXBhdChzdHJ1Y3QgZmlsZSAqIGZpbGUs
CiAJY2FzZSBDSElPSU5JVEVMRU06CiAJY2FzZSBDSElPU1ZPTFRBRzoKIAkJLyogY29tcGF0aWJs
ZSAqLwotCQlyZXR1cm4gY2hfaW9jdGwoZmlsZSwgY21kLCBhcmcpOworCQlyZXR1cm4gY2hfaW9j
dGwoZmlsZSwgY21kLCAodW5zaWduZWQgbG9uZyljb21wYXRfcHRyKGFyZykpOwogCWNhc2UgQ0hJ
T0dTVEFUVVMzMjoKIAl7CiAJCXN0cnVjdCBjaGFuZ2VyX2VsZW1lbnRfc3RhdHVzMzIgY2VzMzI7
CkBAIC04OTgsOCArOTAyLDcgQEAgc3RhdGljIGxvbmcgY2hfaW9jdGxfY29tcGF0KHN0cnVjdCBm
aWxlICogZmlsZSwKIAkJcmV0dXJuIGNoX2dzdGF0dXMoY2gsIGNlczMyLmNlc190eXBlLCBkYXRh
KTsKIAl9CiAJZGVmYXVsdDoKLQkJLy8gcmV0dXJuIHNjc2lfaW9jdGxfY29tcGF0KGNoLT5kZXZp
Y2UsIGNtZCwgKHZvaWQqKWFyZyk7Ci0JCXJldHVybiAtRU5PSU9DVExDTUQ7CisJCXJldHVybiBz
Y3NpX2NvbXBhdF9pb2N0bChjaC0+ZGV2aWNlLCBjbWQsIGNvbXBhdF9wdHIoYXJnKSk7CiAKIAl9
CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvc2QuYyBiL2RyaXZlcnMvc2NzaS9zZC5jCmlu
ZGV4IGNlYTYyNTkwNjQ0MC4uNWFmYjAwNDZiMTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Njc2kv
c2QuYworKysgYi9kcml2ZXJzL3Njc2kvc2QuYwpAQCAtMTQ2NSwxMyArMTQ2NSwxMiBAQCBzdGF0
aWMgaW50IHNkX2dldGdlbyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBzdHJ1Y3QgaGRfZ2Vv
bWV0cnkgKmdlbykKICAqCU5vdGU6IG1vc3QgaW9jdGxzIGFyZSBmb3J3YXJkIG9udG8gdGhlIGJs
b2NrIHN1YnN5c3RlbSBvciBmdXJ0aGVyCiAgKglkb3duIGluIHRoZSBzY3NpIHN1YnN5c3RlbS4K
ICAqKi8KLXN0YXRpYyBpbnQgc2RfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1v
ZGVfdCBtb2RlLAotCQkgICAgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpCitz
dGF0aWMgaW50IHNkX2lvY3RsX2NvbW1vbihzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBmbW9k
ZV90IG1vZGUsCisJCQkgICB1bnNpZ25lZCBpbnQgY21kLCB2b2lkIF9fdXNlciAqcCkKIHsKIAlz
dHJ1Y3QgZ2VuZGlzayAqZGlzayA9IGJkZXYtPmJkX2Rpc2s7CiAJc3RydWN0IHNjc2lfZGlzayAq
c2RrcCA9IHNjc2lfZGlzayhkaXNrKTsKIAlzdHJ1Y3Qgc2NzaV9kZXZpY2UgKnNkcCA9IHNka3At
PmRldmljZTsKLQl2b2lkIF9fdXNlciAqcCA9ICh2b2lkIF9fdXNlciAqKWFyZzsKIAlpbnQgZXJy
b3I7CiAgICAgCiAJU0NTSV9MT0dfSU9DVEwoMSwgc2RfcHJpbnRrKEtFUk5fSU5GTywgc2RrcCwg
InNkX2lvY3RsOiBkaXNrPSVzLCAiCkBAIC0xNTA3LDkgKzE1MDYsNiBAQCBzdGF0aWMgaW50IHNk
X2lvY3RsKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwKIAkJCWJyZWFr
OwogCQlkZWZhdWx0OgogCQkJZXJyb3IgPSBzY3NpX2NtZF9ibGtfaW9jdGwoYmRldiwgbW9kZSwg
Y21kLCBwKTsKLQkJCWlmIChlcnJvciAhPSAtRU5PVFRZKQotCQkJCWJyZWFrOwotCQkJZXJyb3Ig
PSBzY3NpX2lvY3RsKHNkcCwgY21kLCBwKTsKIAkJCWJyZWFrOwogCX0KIG91dDoKQEAgLTE2OTEs
MzkgKzE2ODcsMzEgQEAgc3RhdGljIHZvaWQgc2RfcmVzY2FuKHN0cnVjdCBkZXZpY2UgKmRldikK
IAlyZXZhbGlkYXRlX2Rpc2soc2RrcC0+ZGlzayk7CiB9CiAKK3N0YXRpYyBpbnQgc2RfaW9jdGwo
c3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2RlLAorCQkgICAgdW5zaWduZWQg
aW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpCit7CisJdm9pZCBfX3VzZXIgKnAgPSAodm9pZCBf
X3VzZXIgKilhcmc7CisJaW50IHJldDsKKworCXJldCA9IHNkX2lvY3RsX2NvbW1vbihiZGV2LCBt
b2RlLCBjbWQsIHApOworCWlmIChyZXQgIT0gLUVOT1RUWSkKKwkJcmV0dXJuIHJldDsKKworCXJl
dHVybiBzY3NpX2lvY3RsKHNjc2lfZGlzayhiZGV2LT5iZF9kaXNrKS0+ZGV2aWNlLCBjbWQsIHAp
OworfQogCiAjaWZkZWYgQ09ORklHX0NPTVBBVAotLyogCi0gKiBUaGlzIGdldHMgZGlyZWN0bHkg
Y2FsbGVkIGZyb20gVkZTLiBXaGVuIHRoZSBpb2N0bCAKLSAqIGlzIG5vdCByZWNvZ25pemVkIHdl
IGdvIGJhY2sgdG8gdGhlIG90aGVyIHRyYW5zbGF0aW9uIHBhdGhzLiAKLSAqLwogc3RhdGljIGlu
dCBzZF9jb21wYXRfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2Rl
LAogCQkJICAgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpCiB7Ci0Jc3RydWN0
IGdlbmRpc2sgKmRpc2sgPSBiZGV2LT5iZF9kaXNrOwotCXN0cnVjdCBzY3NpX2Rpc2sgKnNka3Ag
PSBzY3NpX2Rpc2soZGlzayk7Ci0Jc3RydWN0IHNjc2lfZGV2aWNlICpzZGV2ID0gc2RrcC0+ZGV2
aWNlOwogCXZvaWQgX191c2VyICpwID0gY29tcGF0X3B0cihhcmcpOwotCWludCBlcnJvcjsKLQot
CWVycm9yID0gc2NzaV92ZXJpZnlfYmxrX2lvY3RsKGJkZXYsIGNtZCk7Ci0JaWYgKGVycm9yIDwg
MCkKLQkJcmV0dXJuIGVycm9yOworCWludCByZXQ7CiAKLQllcnJvciA9IHNjc2lfaW9jdGxfYmxv
Y2tfd2hlbl9wcm9jZXNzaW5nX2Vycm9ycyhzZGV2LCBjbWQsCi0JCQkobW9kZSAmIEZNT0RFX05E
RUxBWSkgIT0gMCk7Ci0JaWYgKGVycm9yKQotCQlyZXR1cm4gZXJyb3I7CisJcmV0ID0gc2RfaW9j
dGxfY29tbW9uKGJkZXYsIG1vZGUsIGNtZCwgcCk7CisJaWYgKHJldCAhPSAtRU5PVFRZKQorCQly
ZXR1cm4gcmV0OwogCi0JaWYgKGlzX3NlZF9pb2N0bChjbWQpKQotCQlyZXR1cm4gc2VkX2lvY3Rs
KHNka3AtPm9wYWxfZGV2LCBjbWQsIHApOwotCSAgICAgICAKLQkvKiAKLQkgKiBMZXQgdGhlIHN0
YXRpYyBpb2N0bCB0cmFuc2xhdGlvbiB0YWJsZSB0YWtlIGNhcmUgb2YgaXQuCi0JICovCi0JaWYg
KCFzZGV2LT5ob3N0LT5ob3N0dC0+Y29tcGF0X2lvY3RsKQotCQlyZXR1cm4gLUVOT0lPQ1RMQ01E
OyAKLQlyZXR1cm4gc2Rldi0+aG9zdC0+aG9zdHQtPmNvbXBhdF9pb2N0bChzZGV2LCBjbWQsIHAp
OworCXJldHVybiBzY3NpX2NvbXBhdF9pb2N0bChzY3NpX2Rpc2soYmRldi0+YmRfZGlzayktPmRl
dmljZSwgY21kLCBwKTsKIH0KICNlbmRpZgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvc2cu
YyBiL2RyaXZlcnMvc2NzaS9zZy5jCmluZGV4IDk4NTU0NmFhYzIzNi4uMDhlZmNlZTdhMzRkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3Njc2kvc2cuYworKysgYi9kcml2ZXJzL3Njc2kvc2cuYwpAQCAt
OTEwLDE5ICs5MTAsMTQgQEAgc3RhdGljIGludCBwdXRfY29tcGF0X3JlcXVlc3RfdGFibGUoc3Ry
dWN0IGNvbXBhdF9zZ19yZXFfaW5mbyBfX3VzZXIgKm8sCiAjZW5kaWYKIAogc3RhdGljIGxvbmcK
LXNnX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBpbnQgY21kX2luLCB1bnNpZ25l
ZCBsb25nIGFyZykKK3NnX2lvY3RsX2NvbW1vbihzdHJ1Y3QgZmlsZSAqZmlscCwgU2dfZGV2aWNl
ICpzZHAsIFNnX2ZkICpzZnAsCisJCXVuc2lnbmVkIGludCBjbWRfaW4sIHZvaWQgX191c2VyICpw
KQogewotCXZvaWQgX191c2VyICpwID0gKHZvaWQgX191c2VyICopYXJnOwogCWludCBfX3VzZXIg
KmlwID0gcDsKIAlpbnQgcmVzdWx0LCB2YWwsIHJlYWRfb25seTsKLQlTZ19kZXZpY2UgKnNkcDsK
LQlTZ19mZCAqc2ZwOwogCVNnX3JlcXVlc3QgKnNycDsKIAl1bnNpZ25lZCBsb25nIGlmbGFnczsK
IAotCWlmICgoIShzZnAgPSAoU2dfZmQgKikgZmlscC0+cHJpdmF0ZV9kYXRhKSkgfHwgKCEoc2Rw
ID0gc2ZwLT5wYXJlbnRkcCkpKQotCQlyZXR1cm4gLUVOWElPOwotCiAJU0NTSV9MT0dfVElNRU9V
VCgzLCBzZ19wcmludGsoS0VSTl9JTkZPLCBzZHAsCiAJCQkJICAgInNnX2lvY3RsOiBjbWQ9MHgl
eFxuIiwgKGludCkgY21kX2luKSk7CiAJcmVhZF9vbmx5ID0gKE9fUkRXUiAhPSAoZmlscC0+Zl9m
bGFncyAmIE9fQUNDTU9ERSkpOwpAQCAtMTE0NSwyOSArMTE0MCw0NCBAQCBzZ19pb2N0bChzdHJ1
Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZF9pbiwgdW5zaWduZWQgbG9uZyBhcmcpCiAJ
CQljbWRfaW4sIGZpbHAtPmZfZmxhZ3MgJiBPX05ERUxBWSk7CiAJaWYgKHJlc3VsdCkKIAkJcmV0
dXJuIHJlc3VsdDsKKworCXJldHVybiAtRU5PSU9DVExDTUQ7Cit9CisKK3N0YXRpYyBsb25nCitz
Z19pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZF9pbiwgdW5zaWduZWQg
bG9uZyBhcmcpCit7CisJdm9pZCBfX3VzZXIgKnAgPSAodm9pZCBfX3VzZXIgKilhcmc7CisJU2df
ZGV2aWNlICpzZHA7CisJU2dfZmQgKnNmcDsKKwlpbnQgcmV0OworCisJaWYgKCghKHNmcCA9IChT
Z19mZCAqKSBmaWxwLT5wcml2YXRlX2RhdGEpKSB8fCAoIShzZHAgPSBzZnAtPnBhcmVudGRwKSkp
CisJCXJldHVybiAtRU5YSU87CisKKwlyZXQgPSBzZ19pb2N0bF9jb21tb24oZmlscCwgc2RwLCBz
ZnAsIGNtZF9pbiwgcCk7CisJaWYgKHJldCAhPSAtRU5PSU9DVExDTUQpCisJCXJldHVybiByZXQ7
CisKIAlyZXR1cm4gc2NzaV9pb2N0bChzZHAtPmRldmljZSwgY21kX2luLCBwKTsKIH0KIAogI2lm
ZGVmIENPTkZJR19DT01QQVQKIHN0YXRpYyBsb25nIHNnX2NvbXBhdF9pb2N0bChzdHJ1Y3QgZmls
ZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZF9pbiwgdW5zaWduZWQgbG9uZyBhcmcpCiB7CisJdm9p
ZCBfX3VzZXIgKnAgPSBjb21wYXRfcHRyKGFyZyk7CiAJU2dfZGV2aWNlICpzZHA7CiAJU2dfZmQg
KnNmcDsKLQlzdHJ1Y3Qgc2NzaV9kZXZpY2UgKnNkZXY7CisJaW50IHJldDsKIAogCWlmICgoIShz
ZnAgPSAoU2dfZmQgKikgZmlscC0+cHJpdmF0ZV9kYXRhKSkgfHwgKCEoc2RwID0gc2ZwLT5wYXJl
bnRkcCkpKQogCQlyZXR1cm4gLUVOWElPOwogCi0Jc2RldiA9IHNkcC0+ZGV2aWNlOwotCWlmIChz
ZGV2LT5ob3N0LT5ob3N0dC0+Y29tcGF0X2lvY3RsKSB7IAotCQlpbnQgcmV0OwotCi0JCXJldCA9
IHNkZXYtPmhvc3QtPmhvc3R0LT5jb21wYXRfaW9jdGwoc2RldiwgY21kX2luLCAodm9pZCBfX3Vz
ZXIgKilhcmcpOwotCisJcmV0ID0gc2dfaW9jdGxfY29tbW9uKGZpbHAsIHNkcCwgc2ZwLCBjbWRf
aW4sIHApOworCWlmIChyZXQgIT0gLUVOT0lPQ1RMQ01EKQogCQlyZXR1cm4gcmV0OwotCX0KLQkK
LQlyZXR1cm4gLUVOT0lPQ1RMQ01EOworCisJcmV0dXJuIHNjc2lfY29tcGF0X2lvY3RsKHNkcC0+
ZGV2aWNlLCBjbWRfaW4sIHApOwogfQogI2VuZGlmCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2Nz
aS9zci5jIGIvZHJpdmVycy9zY3NpL3NyLmMKaW5kZXggNDY2NGZkZjc1YzBmLi42MDMzYTg4NmM0
MmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS9zci5jCisrKyBiL2RyaXZlcnMvc2NzaS9zci5j
CkBAIC0zOCw2ICszOCw3IEBACiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8
bGludXgvbW0uaD4KICNpbmNsdWRlIDxsaW51eC9iaW8uaD4KKyNpbmNsdWRlIDxsaW51eC9jb21w
YXQuaD4KICNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5o
PgogI2luY2x1ZGUgPGxpbnV4L2Nkcm9tLmg+CkBAIC01OTgsNiArNTk5LDU1IEBAIHN0YXRpYyBp
bnQgc3JfYmxvY2tfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2Rl
LCB1bnNpZ25lZCBjbWQsCiAJcmV0dXJuIHJldDsKIH0KIAorI2lmZGVmIENPTkZJR19DT01QQVQK
K3N0YXRpYyBpbnQgc3JfYmxvY2tfY29tcGF0X2lvY3RsKHN0cnVjdCBibG9ja19kZXZpY2UgKmJk
ZXYsIGZtb2RlX3QgbW9kZSwgdW5zaWduZWQgY21kLAorCQkJICB1bnNpZ25lZCBsb25nIGFyZykK
K3sKKwlzdHJ1Y3Qgc2NzaV9jZCAqY2QgPSBzY3NpX2NkKGJkZXYtPmJkX2Rpc2spOworCXN0cnVj
dCBzY3NpX2RldmljZSAqc2RldiA9IGNkLT5kZXZpY2U7CisJdm9pZCBfX3VzZXIgKmFyZ3AgPSBj
b21wYXRfcHRyKGFyZyk7CisJaW50IHJldDsKKworCW11dGV4X2xvY2soJnNyX211dGV4KTsKKwor
CXJldCA9IHNjc2lfaW9jdGxfYmxvY2tfd2hlbl9wcm9jZXNzaW5nX2Vycm9ycyhzZGV2LCBjbWQs
CisJCQkobW9kZSAmIEZNT0RFX05ERUxBWSkgIT0gMCk7CisJaWYgKHJldCkKKwkJZ290byBvdXQ7
CisKKwlzY3NpX2F1dG9wbV9nZXRfZGV2aWNlKHNkZXYpOworCisJLyoKKwkgKiBTZW5kIFNDU0kg
YWRkcmVzc2luZyBpb2N0bHMgZGlyZWN0bHkgdG8gbWlkIGxldmVsLCBzZW5kIG90aGVyCisJICog
aW9jdGxzIHRvIGNkcm9tL2Jsb2NrIGxldmVsLgorCSAqLworCXN3aXRjaCAoY21kKSB7CisJY2Fz
ZSBTQ1NJX0lPQ1RMX0dFVF9JRExVTjoKKwljYXNlIFNDU0lfSU9DVExfR0VUX0JVU19OVU1CRVI6
CisJCXJldCA9IHNjc2lfY29tcGF0X2lvY3RsKHNkZXYsIGNtZCwgYXJncCk7CisJCWdvdG8gcHV0
OworCX0KKworCS8qCisJICogQ0RST00gaW9jdGxzIGFyZSBoYW5kbGVkIGluIHRoZSBibG9jayBs
YXllciwgYnV0CisJICogZG8gdGhlIHNjc2kgYmxrIGlvY3RscyBoZXJlLgorCSAqLworCXJldCA9
IHNjc2lfY21kX2Jsa19pb2N0bChiZGV2LCBtb2RlLCBjbWQsIGFyZ3ApOworCWlmIChyZXQgIT0g
LUVOT1RUWSkKKwkJcmV0dXJuIHJldDsKKworCXJldCA9IHNjc2lfY29tcGF0X2lvY3RsKHNkZXYs
IGNtZCwgYXJncCk7CisKK3B1dDoKKwlzY3NpX2F1dG9wbV9wdXRfZGV2aWNlKHNkZXYpOworCitv
dXQ6CisJbXV0ZXhfdW5sb2NrKCZzcl9tdXRleCk7CisJcmV0dXJuIHJldDsKKworfQorI2VuZGlm
CisKIHN0YXRpYyB1bnNpZ25lZCBpbnQgc3JfYmxvY2tfY2hlY2tfZXZlbnRzKHN0cnVjdCBnZW5k
aXNrICpkaXNrLAogCQkJCQkgIHVuc2lnbmVkIGludCBjbGVhcmluZykKIHsKQEAgLTY0MSwxMiAr
NjkxLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmxvY2tfZGV2aWNlX29wZXJhdGlvbnMgc3Jf
YmRvcHMgPQogCS5vcGVuCQk9IHNyX2Jsb2NrX29wZW4sCiAJLnJlbGVhc2UJPSBzcl9ibG9ja19y
ZWxlYXNlLAogCS5pb2N0bAkJPSBzcl9ibG9ja19pb2N0bCwKKyNpZmRlZiBDT05GSUdfQ09NUEFU
CisJLmlvY3RsCQk9IHNyX2Jsb2NrX2NvbXBhdF9pb2N0bCwKKyNlbmRpZgogCS5jaGVja19ldmVu
dHMJPSBzcl9ibG9ja19jaGVja19ldmVudHMsCiAJLnJldmFsaWRhdGVfZGlzayA9IHNyX2Jsb2Nr
X3JldmFsaWRhdGVfZGlzaywKLQkvKiAKLQkgKiBObyBjb21wYXRfaW9jdGwgZm9yIG5vdyBiZWNh
dXNlIHNyX2Jsb2NrX2lvY3RsIG5ldmVyCi0JICogc2VlbXMgdG8gcGFzcyBhcmJpdHJhcnkgaW9j
dGxzIGRvd24gdG8gaG9zdCBkcml2ZXJzLgotCSAqLwogfTsKIAogc3RhdGljIGludCBzcl9vcGVu
KHN0cnVjdCBjZHJvbV9kZXZpY2VfaW5mbyAqY2RpLCBpbnQgcHVycG9zZSkKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc2NzaS9zdC5jIGIvZHJpdmVycy9zY3NpL3N0LmMKaW5kZXggOWUzZmZmMmRlODNl
Li4zOTNmMzAxOWNjYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS9zdC5jCisrKyBiL2RyaXZl
cnMvc2NzaS9zdC5jCkBAIC0zNTAxLDcgKzM1MDEsNyBAQCBzdGF0aWMgaW50IHBhcnRpdGlvbl90
YXBlKHN0cnVjdCBzY3NpX3RhcGUgKlNUcCwgaW50IHNpemUpCiAKIAogLyogVGhlIGlvY3RsIGNv
bW1hbmQgKi8KLXN0YXRpYyBsb25nIHN0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25l
ZCBpbnQgY21kX2luLCB1bnNpZ25lZCBsb25nIGFyZykKK3N0YXRpYyBsb25nIHN0X2lvY3RsX2Nv
bW1vbihzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZF9pbiwgdm9pZCBfX3VzZXIg
KnApCiB7CiAJaW50IGksIGNtZF9uciwgY21kX3R5cGUsIGJ0OwogCWludCByZXR2YWwgPSAwOwpA
QCAtMzUwOSw3ICszNTA5LDYgQEAgc3RhdGljIGxvbmcgc3RfaW9jdGwoc3RydWN0IGZpbGUgKmZp
bGUsIHVuc2lnbmVkIGludCBjbWRfaW4sIHVuc2lnbmVkIGxvbmcgYXJnKQogCXN0cnVjdCBzY3Np
X3RhcGUgKlNUcCA9IGZpbGUtPnByaXZhdGVfZGF0YTsKIAlzdHJ1Y3Qgc3RfbW9kZWRlZiAqU1Rt
OwogCXN0cnVjdCBzdF9wYXJ0c3RhdCAqU1RwczsKLQl2b2lkIF9fdXNlciAqcCA9ICh2b2lkIF9f
dXNlciAqKWFyZzsKIAogCWlmIChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJlNUcC0+bG9jaykp
CiAJCXJldHVybiAtRVJFU1RBUlRTWVM7CkBAIC0zODI0LDkgKzM4MjMsMTkgQEAgc3RhdGljIGxv
bmcgc3RfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWRfaW4sIHVuc2ln
bmVkIGxvbmcgYXJnKQogCX0KIAltdXRleF91bmxvY2soJlNUcC0+bG9jayk7CiAJc3dpdGNoIChj
bWRfaW4pIHsKKwkJY2FzZSBTQ1NJX0lPQ1RMX1NUT1BfVU5JVDoKKwkJCS8qIHVubG9hZCAqLwor
CQkJcmV0dmFsID0gc2NzaV9pb2N0bChTVHAtPmRldmljZSwgY21kX2luLCBwKTsKKwkJCWlmICgh
cmV0dmFsKSB7CisJCQkJU1RwLT5yZXdfYXRfY2xvc2UgPSAwOworCQkJCVNUcC0+cmVhZHkgPSBT
VF9OT19UQVBFOworCQkJfQorCQkJcmV0dXJuIHJldHZhbDsKKwogCQljYXNlIFNDU0lfSU9DVExf
R0VUX0lETFVOOgogCQljYXNlIFNDU0lfSU9DVExfR0VUX0JVU19OVU1CRVI6CiAJCQlicmVhazsK
KwogCQlkZWZhdWx0OgogCQkJaWYgKChjbWRfaW4gPT0gU0dfSU8gfHwKIAkJCSAgICAgY21kX2lu
ID09IFNDU0lfSU9DVExfU0VORF9DT01NQU5EIHx8CkBAIC0zODQwLDQyICszODQ5LDQ2IEBAIHN0
YXRpYyBsb25nIHN0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kX2lu
LCB1bnNpZ25lZCBsb25nIGFyZykKIAkJCQlyZXR1cm4gaTsKIAkJCWJyZWFrOwogCX0KLQlyZXR2
YWwgPSBzY3NpX2lvY3RsKFNUcC0+ZGV2aWNlLCBjbWRfaW4sIHApOwotCWlmICghcmV0dmFsICYm
IGNtZF9pbiA9PSBTQ1NJX0lPQ1RMX1NUT1BfVU5JVCkgeyAvKiB1bmxvYWQgKi8KLQkJU1RwLT5y
ZXdfYXRfY2xvc2UgPSAwOwotCQlTVHAtPnJlYWR5ID0gU1RfTk9fVEFQRTsKLQl9Ci0JcmV0dXJu
IHJldHZhbDsKKwlyZXR1cm4gLUVOT1RUWTsKIAogIG91dDoKIAltdXRleF91bmxvY2soJlNUcC0+
bG9jayk7CiAJcmV0dXJuIHJldHZhbDsKIH0KIAorc3RhdGljIGxvbmcgc3RfaW9jdGwoc3RydWN0
IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWRfaW4sIHVuc2lnbmVkIGxvbmcgYXJnKQorewor
CXZvaWQgX191c2VyICpwID0gKHZvaWQgX191c2VyICopYXJnOworCXN0cnVjdCBzY3NpX3RhcGUg
KlNUcCA9IGZpbGUtPnByaXZhdGVfZGF0YTsKKwlpbnQgcmV0OworCisJcmV0ID0gc3RfaW9jdGxf
Y29tbW9uKGZpbGUsIGNtZF9pbiwgcCk7CisJaWYgKHJldCAhPSAtRU5PVFRZKQorCQlyZXR1cm4g
cmV0OworCisJcmV0dXJuIHNjc2lfaW9jdGwoU1RwLT5kZXZpY2UsIGNtZF9pbiwgcCk7Cit9CisK
ICNpZmRlZiBDT05GSUdfQ09NUEFUCiBzdGF0aWMgbG9uZyBzdF9jb21wYXRfaW9jdGwoc3RydWN0
IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWRfaW4sIHVuc2lnbmVkIGxvbmcgYXJnKQogewog
CXZvaWQgX191c2VyICpwID0gY29tcGF0X3B0cihhcmcpOwogCXN0cnVjdCBzY3NpX3RhcGUgKlNU
cCA9IGZpbGUtPnByaXZhdGVfZGF0YTsKLQlzdHJ1Y3Qgc2NzaV9kZXZpY2UgKnNkZXYgPSBTVHAt
PmRldmljZTsKLQlpbnQgcmV0ID0gLUVOT0lPQ1RMQ01EOworCWludCByZXQ7CiAKIAkvKiBhcmd1
bWVudCBjb252ZXJzaW9uIGlzIGhhbmRsZWQgdXNpbmcgcHV0X3VzZXJfbXRwb3MvcHV0X3VzZXJf
bXRnZXQgKi8KIAlzd2l0Y2ggKGNtZF9pbikgewotCWNhc2UgTVRJT0NUT1A6Ci0JCXJldHVybiBz
dF9pb2N0bChmaWxlLCBNVElPQ1RPUCwgKHVuc2lnbmVkIGxvbmcpcCk7CiAJY2FzZSBNVElPQ1BP
UzMyOgotCQlyZXR1cm4gc3RfaW9jdGwoZmlsZSwgTVRJT0NQT1MsICh1bnNpZ25lZCBsb25nKXAp
OworCQlyZXR1cm4gc3RfaW9jdGxfY29tbW9uKGZpbGUsIE1USU9DUE9TLCBwKTsKIAljYXNlIE1U
SU9DR0VUMzI6Ci0JCXJldHVybiBzdF9pb2N0bChmaWxlLCBNVElPQ0dFVCwgKHVuc2lnbmVkIGxv
bmcpcCk7CisJCXJldHVybiBzdF9pb2N0bF9jb21tb24oZmlsZSwgTVRJT0NHRVQsIHApOwogCX0K
IAotCWlmIChzZGV2LT5ob3N0LT5ob3N0dC0+Y29tcGF0X2lvY3RsKSB7IAorCXJldCA9IHN0X2lv
Y3RsX2NvbW1vbihmaWxlLCBjbWRfaW4sIHApOworCWlmIChyZXQgIT0gLUVOT1RUWSkKKwkJcmV0
dXJuIHJldDsKIAotCQlyZXQgPSBzZGV2LT5ob3N0LT5ob3N0dC0+Y29tcGF0X2lvY3RsKHNkZXYs
IGNtZF9pbiwgKHZvaWQgX191c2VyICopYXJnKTsKLQotCX0KLQlyZXR1cm4gcmV0OworCXJldHVy
biBzY3NpX2NvbXBhdF9pb2N0bChTVHAtPmRldmljZSwgY21kX2luLCBwKTsKIH0KICNlbmRpZgog
CmRpZmYgLS1naXQgYS9mcy9jb21wYXRfaW9jdGwuYyBiL2ZzL2NvbXBhdF9pb2N0bC5jCmluZGV4
IDM1OGVhMmVjZjM2Yi4uYWI0NDcxZjQ2OWU2IDEwMDY0NAotLS0gYS9mcy9jb21wYXRfaW9jdGwu
YworKysgYi9mcy9jb21wYXRfaW9jdGwuYwpAQCAtMzYsMTA5ICszNiwxMSBAQAogCiAjaW5jbHVk
ZSAiaW50ZXJuYWwuaCIKIAotI2lmZGVmIENPTkZJR19CTE9DSwotI2luY2x1ZGUgPGxpbnV4L2Nk
cm9tLmg+Ci0jaW5jbHVkZSA8bGludXgvZmQuaD4KLSNpbmNsdWRlIDxzY3NpL3Njc2kuaD4KLSNp
bmNsdWRlIDxzY3NpL3Njc2lfaW9jdGwuaD4KLSNpbmNsdWRlIDxzY3NpL3NnLmg+Ci0jZW5kaWYK
LQogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC93YXRjaGRvZy5o
PgogCiAjaW5jbHVkZSA8bGludXgvaGlkZGV2Lmg+CiAKLQotI2luY2x1ZGUgPGxpbnV4L3NvcnQu
aD4KLQotLyoKLSAqIHNpbXBsZSByZXZlcnNpYmxlIHRyYW5zZm9ybSB0byBtYWtlIG91ciB0YWJs
ZSBtb3JlIGV2ZW5seQotICogZGlzdHJpYnV0ZWQgYWZ0ZXIgc29ydGluZy4KLSAqLwotI2RlZmlu
ZSBYRk9STShpKSAoKChpKSBeICgoaSkgPDwgMjcpIF4gKChpKSA8PCAxNykpICYgMHhmZmZmZmZm
ZikKLQotI2RlZmluZSBDT01QQVRJQkxFX0lPQ1RMKGNtZCkgWEZPUk0oKHUzMiljbWQpLAotc3Rh
dGljIHVuc2lnbmVkIGludCBpb2N0bF9wb2ludGVyW10gPSB7Ci0jaWZkZWYgQ09ORklHX0JMT0NL
Ci0vKiBCaWcgUyAqLwotQ09NUEFUSUJMRV9JT0NUTChTQ1NJX0lPQ1RMX0dFVF9JRExVTikKLUNP
TVBBVElCTEVfSU9DVEwoU0NTSV9JT0NUTF9ET09STE9DSykKLUNPTVBBVElCTEVfSU9DVEwoU0NT
SV9JT0NUTF9ET09SVU5MT0NLKQotQ09NUEFUSUJMRV9JT0NUTChTQ1NJX0lPQ1RMX1RFU1RfVU5J
VF9SRUFEWSkKLUNPTVBBVElCTEVfSU9DVEwoU0NTSV9JT0NUTF9HRVRfQlVTX05VTUJFUikKLUNP
TVBBVElCTEVfSU9DVEwoU0NTSV9JT0NUTF9TRU5EX0NPTU1BTkQpCi1DT01QQVRJQkxFX0lPQ1RM
KFNDU0lfSU9DVExfUFJPQkVfSE9TVCkKLUNPTVBBVElCTEVfSU9DVEwoU0NTSV9JT0NUTF9HRVRf
UENJKQotI2VuZGlmCi0jaWZkZWYgQ09ORklHX0JMT0NLCi0vKiBTRyBzdHVmZiAqLwotQ09NUEFU
SUJMRV9JT0NUTChTR19JTykKLUNPTVBBVElCTEVfSU9DVEwoU0dfR0VUX1JFUVVFU1RfVEFCTEUp
Ci1DT01QQVRJQkxFX0lPQ1RMKFNHX1NFVF9USU1FT1VUKQotQ09NUEFUSUJMRV9JT0NUTChTR19H
RVRfVElNRU9VVCkKLUNPTVBBVElCTEVfSU9DVEwoU0dfRU1VTEFURURfSE9TVCkKLUNPTVBBVElC
TEVfSU9DVEwoU0dfR0VUX1RSQU5TRk9STSkKLUNPTVBBVElCTEVfSU9DVEwoU0dfU0VUX1JFU0VS
VkVEX1NJWkUpCi1DT01QQVRJQkxFX0lPQ1RMKFNHX0dFVF9SRVNFUlZFRF9TSVpFKQotQ09NUEFU
SUJMRV9JT0NUTChTR19HRVRfU0NTSV9JRCkKLUNPTVBBVElCTEVfSU9DVEwoU0dfU0VUX0ZPUkNF
X0xPV19ETUEpCi1DT01QQVRJQkxFX0lPQ1RMKFNHX0dFVF9MT1dfRE1BKQotQ09NUEFUSUJMRV9J
T0NUTChTR19TRVRfRk9SQ0VfUEFDS19JRCkKLUNPTVBBVElCTEVfSU9DVEwoU0dfR0VUX1BBQ0tf
SUQpCi1DT01QQVRJQkxFX0lPQ1RMKFNHX0dFVF9OVU1fV0FJVElORykKLUNPTVBBVElCTEVfSU9D
VEwoU0dfU0VUX0RFQlVHKQotQ09NUEFUSUJMRV9JT0NUTChTR19HRVRfU0dfVEFCTEVTSVpFKQot
Q09NUEFUSUJMRV9JT0NUTChTR19HRVRfQ09NTUFORF9RKQotQ09NUEFUSUJMRV9JT0NUTChTR19T
RVRfQ09NTUFORF9RKQotQ09NUEFUSUJMRV9JT0NUTChTR19HRVRfVkVSU0lPTl9OVU0pCi1DT01Q
QVRJQkxFX0lPQ1RMKFNHX05FWFRfQ01EX0xFTikKLUNPTVBBVElCTEVfSU9DVEwoU0dfU0NTSV9S
RVNFVCkKLUNPTVBBVElCTEVfSU9DVEwoU0dfR0VUX1JFUVVFU1RfVEFCTEUpCi1DT01QQVRJQkxF
X0lPQ1RMKFNHX1NFVF9LRUVQX09SUEhBTikKLUNPTVBBVElCTEVfSU9DVEwoU0dfR0VUX0tFRVBf
T1JQSEFOKQotI2VuZGlmCi19OwotCi0vKgotICogQ29udmVydCBjb21tb24gaW9jdGwgYXJndW1l
bnRzIGJhc2VkIG9uIHRoZWlyIGNvbW1hbmQgbnVtYmVyCi0gKgotICogUGxlYXNlIGRvIG5vdCBh
ZGQgYW55IGNvZGUgaW4gaGVyZS4gSW5zdGVhZCwgaW1wbGVtZW50Ci0gKiBhIGNvbXBhdF9pb2N0
bCBvcGVyYXRpb24gaW4gdGhlIHBsYWNlIHRoYXQgaGFuZGxl0ZUgdGhlCi0gKiBpb2N0bCBmb3Ig
dGhlIG5hdGl2ZSBjYXNlLgotICovCi1zdGF0aWMgbG9uZyBkb19pb2N0bF90cmFucyh1bnNpZ25l
ZCBpbnQgY21kLAotCQkgdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCBmaWxlICpmaWxlKQotewot
CXJldHVybiAtRU5PSU9DVExDTUQ7Ci19Ci0KLXN0YXRpYyBpbnQgY29tcGF0X2lvY3RsX2NoZWNr
X3RhYmxlKHVuc2lnbmVkIGludCB4Y21kKQotewotI2lmZGVmIENPTkZJR19CTE9DSwotCWludCBp
OwotCWNvbnN0IGludCBtYXggPSBBUlJBWV9TSVpFKGlvY3RsX3BvaW50ZXIpIC0gMTsKLQotCUJV
SUxEX0JVR19PTihtYXggPj0gKDEgPDwgMTYpKTsKLQotCS8qIGd1ZXNzIGluaXRpYWwgb2Zmc2V0
IGludG8gdGFibGUsIGFzc3VtaW5nIGEKLQkgICBub3JtYWxpemVkIGRpc3RyaWJ1dGlvbiAqLwot
CWkgPSAoKHhjbWQgPj4gMTYpICogbWF4KSA+PiAxNjsKLQotCS8qIGRvIGxpbmVhciBzZWFyY2gg
dXAgZmlyc3QsIHVudGlsIGdyZWF0ZXIgb3IgZXF1YWwgKi8KLQl3aGlsZSAoaW9jdGxfcG9pbnRl
cltpXSA8IHhjbWQgJiYgaSA8IG1heCkKLQkJaSsrOwotCi0JLyogdGhlbiBkbyBsaW5lYXIgc2Vh
cmNoIGRvd24gKi8KLQl3aGlsZSAoaW9jdGxfcG9pbnRlcltpXSA+IHhjbWQgJiYgaSA+IDApCi0J
CWktLTsKLQotCXJldHVybiBpb2N0bF9wb2ludGVyW2ldID09IHhjbWQ7Ci0jZWxzZQotCXJldHVy
biAwOwotI2VuZGlmCi19Ci0KIENPTVBBVF9TWVNDQUxMX0RFRklORTMoaW9jdGwsIHVuc2lnbmVk
IGludCwgZmQsIHVuc2lnbmVkIGludCwgY21kLAogCQkgICAgICAgY29tcGF0X3Vsb25nX3QsIGFy
ZzMyKQogewpAQCAtMjE2LDE5ICsxMTgsOSBAQCBDT01QQVRfU1lTQ0FMTF9ERUZJTkUzKGlvY3Rs
LCB1bnNpZ25lZCBpbnQsIGZkLCB1bnNpZ25lZCBpbnQsIGNtZCwKIAkJCQlnb3RvIG91dF9mcHV0
OwogCQl9CiAKLQkJaWYgKCFmLmZpbGUtPmZfb3AtPnVubG9ja2VkX2lvY3RsKQotCQkJZ290byBk
b19pb2N0bDsKLQkJYnJlYWs7Ci0JfQotCi0JaWYgKGNvbXBhdF9pb2N0bF9jaGVja190YWJsZShY
Rk9STShjbWQpKSkKLQkJZ290byBmb3VuZF9oYW5kbGVyOwotCi0JZXJyb3IgPSBkb19pb2N0bF90
cmFucyhjbWQsIGFyZywgZi5maWxlKTsKLQlpZiAoZXJyb3IgPT0gLUVOT0lPQ1RMQ01EKQogCQll
cnJvciA9IC1FTk9UVFk7Ci0KLQlnb3RvIG91dF9mcHV0OworCQlnb3RvIG91dF9mcHV0OworCX0K
IAogIGZvdW5kX2hhbmRsZXI6CiAJYXJnID0gKHVuc2lnbmVkIGxvbmcpY29tcGF0X3B0cihhcmcp
OwpAQCAtMjM5LDIzICsxMzEsMyBAQCBDT01QQVRfU1lTQ0FMTF9ERUZJTkUzKGlvY3RsLCB1bnNp
Z25lZCBpbnQsIGZkLCB1bnNpZ25lZCBpbnQsIGNtZCwKICBvdXQ6CiAJcmV0dXJuIGVycm9yOwog
fQotCi1zdGF0aWMgaW50IF9faW5pdCBpbml0X3N5czMyX2lvY3RsX2NtcChjb25zdCB2b2lkICpw
LCBjb25zdCB2b2lkICpxKQotewotCXVuc2lnbmVkIGludCBhLCBiOwotCWEgPSAqKHVuc2lnbmVk
IGludCAqKXA7Ci0JYiA9ICoodW5zaWduZWQgaW50ICopcTsKLQlpZiAoYSA+IGIpCi0JCXJldHVy
biAxOwotCWlmIChhIDwgYikKLQkJcmV0dXJuIC0xOwotCXJldHVybiAwOwotfQotCi1zdGF0aWMg
aW50IF9faW5pdCBpbml0X3N5czMyX2lvY3RsKHZvaWQpCi17Ci0Jc29ydChpb2N0bF9wb2ludGVy
LCBBUlJBWV9TSVpFKGlvY3RsX3BvaW50ZXIpLCBzaXplb2YoKmlvY3RsX3BvaW50ZXIpLAotCQlp
bml0X3N5czMyX2lvY3RsX2NtcCwgTlVMTCk7Ci0JcmV0dXJuIDA7Ci19Ci1fX2luaXRjYWxsKGlu
aXRfc3lzMzJfaW9jdGwpOwotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
