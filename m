Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174920FAC7
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 19:38:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED98687620;
	Tue, 30 Jun 2020 17:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5D_iISJQzPQ; Tue, 30 Jun 2020 17:38:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A47087513;
	Tue, 30 Jun 2020 17:38:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D278C016E;
	Tue, 30 Jun 2020 17:38:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89CB3C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72BAA2281E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NhYH1+-L4ge
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2EBC02042E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:38:26 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1812020774;
 Tue, 30 Jun 2020 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593538706;
 bh=MXGdmzGxV4dcURGH89wsFnnGgTyB+YmHiX7MrSEBkT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dprmmb/MZyqEarIfSctWj4BKy2ESs/GR50yOC716AdiRtob2qZv6kmXmTm3OkhJSI
 PpoV03qqsnutU1BpKbFIF/TOjhGhmjpPEtEUVOEneRx8YxPeQl9rPG67FkeSf3BAce
 BLmwFuNLpi4vQJMQgFPioTA3llzjzWgB5CzwvmsQ=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] Documentation/barriers/kokr: Remove references to
 [smp_]read_barrier_depends()
Date: Tue, 30 Jun 2020 18:37:26 +0100
Message-Id: <20200630173734.14057-11-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200630173734.14057-1-will@kernel.org>
References: <20200630173734.14057-1-will@kernel.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, SeongJae Park <sjpark@amazon.de>,
 virtualization@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Yunjae Lee <lyj7694@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 SeongJae Park <sj38.park@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-alpha@vger.kernel.org
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

RnJvbTogU2VvbmdKYWUgUGFyayA8c2ozOC5wYXJrQGdtYWlsLmNvbT4KClRoaXMgY29tbWl0IHRy
YW5zbGF0ZXMgY29tbWl0ICgiRG9jdW1lbnRhdGlvbi9iYXJyaWVyczogUmVtb3ZlIHJlZmVyZW5j
ZXMgdG8KW3NtcF9dcmVhZF9iYXJyaWVyX2RlcGVuZHMoKSIpIGludG8gS29yZWFuLgoKU2lnbmVk
LW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFl1
bmphZSBMZWUgPGx5ajc2OTRAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPgotLS0KIC4uLi90cmFuc2xhdGlvbnMva29fS1IvbWVtb3J5LWJhcnJp
ZXJzLnR4dCAgICB8IDE0NiArLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDE0MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMva29fS1IvbWVtb3J5LWJhcnJpZXJzLnR4dAppbmRleCAzNGQwNDFkNjhmNzgu
LmExZjc3MmVmNjIyYyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMva29f
S1IvbWVtb3J5LWJhcnJpZXJzLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9r
b19LUi9tZW1vcnktYmFycmllcnMudHh0CkBAIC01NzcsNyArNTc3LDcgQEAgQUNRVUlSRSDripQg
7ZW064u5IOyYpO2NvOugiOydtOyFmOydmCDroZzrk5wg67aA67aE7JeQ66eMIOyggeyaqeuQmOqz
oCBSRUxFQVNFIAog642w7J207YSwIOydmOyhtOyEsSDrsLDrpqzslrQgKOyXreyCrOyggSkKIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAKLeumrOuIheyKpCDsu6TrhJAgdjQuMTUg6riw
7KSA7Jy866GcLCBzbXBfcmVhZF9iYXJyaWVyX2RlcGVuZHMoKSDqsIAgUkVBRF9PTkNFKCkg7JeQ
CivrpqzriIXsiqQg7Luk64SQIHY0LjE1IOq4sOykgOycvOuhnCwgc21wX21iKCkg6rCAIERFQyBB
bHBoYSDsmqkgUkVBRF9PTkNFKCkg7L2U65Oc7JeQCiDstpTqsIDrkJjsl4jripTrjbAsIOydtOuK
lCDsnbQg7IS57IWY7JeQIOyjvOydmOulvCDquLDsmrjsl6zslbwg7ZWY64qUIOyCrOuejOuTpOyd
gCBERUMgQWxwaGEg7JWE7YKk7YWN7LOQCiDsoITsmqkg7L2U65Oc66W8IOunjOuTnOuKlCDsgqzr
nozrk6Tqs7wgUkVBRF9PTkNFKCkg7J6Q7LK066W8IOunjOuTnOuKlCDsgqzrnozrk6Qg67+Q7J6E
7J2EIOydmOuvuO2VqeuLiOuLpC4KIOq3uOufsCDrtoTrk6TsnYQg7JyE7ZW0LCDqt7jrpqzqs6Ag
7Jet7IKs7JeQIOq0gOyLrCDsnojripQg67aE65Ok7J2EIOychO2VtCwg7Jes6riwIOuNsOydtO2E
sCDsnZjsobTshLEKQEAgLTI2NjQsMTQ0ICsyNjY0LDYgQEAgQ1BVIOy9lOyWtOuKlCDtlITroZzq
t7jrnqjsnZgg7J246rO87ISx7J20IOycoOyngOuQnOuLpOqzoOunjCDsl6zqsqjsp4Tri6TrqbQg
CiDsiJjrj4Qg7J6I7Iq164uI64ukLgogCiAKLey6kOyLnCDsnbzqtIDshLEKLS0tLS0tLS0tLS0t
Ci0KLe2VmOyngOunjCDsgrbsnYAg7JWe7JeQ7IScIOydtOyVvOq4sO2VnCDqsoPsspjrn7wg64uo
7Iic7ZWY7KeAIOyViuyKteuLiOuLpDog7LqQ7Iuc65Ok7J2AIOydvOq0gOyggeydvCDqsoPsnLzr
oZwKLeq4sOuMgOuQmOyngOunjCwg6re4IOydvOq0gOyEseydtCDsiJzshJzsl5Drj4Qg7KCB7Jqp
65CgIOqxsOudvOuKlCDrs7TsnqXsnYAg7JeG7Iq164uI64ukLiAg7ZWcIENQVSDsl5DshJwKLeun
jOuTpOyWtOynhCDrs4Dqsr0g7IKs7ZWt7J2AIOy1nOyiheyggeycvOuhnOuKlCDsi5zsiqTthZzs
nZgg66qo65OgIENQVSDsl5Dqsowg67O07Jes7KeA6rKMIOuQmOyngOunjCwg64uk66W4Ci1DUFUg
65Ok7JeQ6rKM64+EIOqwmeydgCDsiJzshJzroZwg67O07J206rKMIOuQoCDqsbDrnbzripQg67O0
7J6l7J2AIOyXhuuLpOuKlCDrnLvsnoXri4jri6QuCi0KLQot65GQ6rCc7J2YIENQVSAoMSAmIDIp
IOqwgCDri6zroKQg7J6I6rOgLCDqsIEgQ1BVIOyXkCDrkZDqsJzsnZgg642w7J207YSwIOy6kOyL
nChDUFUgMSDsnYAgQS9CIOulvCwKLUNQVSAyIOuKlCBDL0Qg66W8IOqwluyKteuLiOuLpCnqsIAg
67OR66Cs66GcIOyXsOqysOuQmOyWtCDsnojripQg7Iuc7Iqk7YWc7J2EIOuLpOujrOuLpOqzoCDs
g53qsIHtlbQKLeu0heyLnOuLpDoKLQotCSAgICAgICAgICAgIDoKLQkgICAgICAgICAgICA6ICAg
ICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0rCi0JICAgICAgICAgICAgOiAgICAgICst
LS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfAotCSstLS0tLS0tLSsgIDogKy0tLT58IENhY2hl
IEEgfDwtLS0tLS0tPnwgICAgICAgIHwKLQl8ICAgICAgICB8ICA6IHwgICAgKy0tLS0tLS0tLSsg
ICAgICAgICB8ICAgICAgICB8Ci0JfCAgQ1BVIDEgfDwtLS0rICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICAgICAgfAotCXwgICAgICAgIHwgIDogfCAgICArLS0tLS0tLS0tKyAgICAgICAgIHwg
ICAgICAgIHwKLQkrLS0tLS0tLS0rICA6ICstLS0+fCBDYWNoZSBCIHw8LS0tLS0tLT58ICAgICAg
ICB8Ci0JICAgICAgICAgICAgOiAgICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfAot
CSAgICAgICAgICAgIDogICAgICAgICAgICAgICAgICAgICAgICAgIHwgTWVtb3J5IHwKLQkgICAg
ICAgICAgICA6ICAgICAgKy0tLS0tLS0tLSsgICAgICAgICB8IFN5c3RlbSB8Ci0JKy0tLS0tLS0t
KyAgOiArLS0tPnwgQ2FjaGUgQyB8PC0tLS0tLS0+fCAgICAgICAgfAotCXwgICAgICAgIHwgIDog
fCAgICArLS0tLS0tLS0tKyAgICAgICAgIHwgICAgICAgIHwKLQl8ICBDUFUgMiB8PC0tLSsgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgICAgICB8Ci0JfCAgICAgICAgfCAgOiB8ICAgICstLS0t
LS0tLS0rICAgICAgICAgfCAgICAgICAgfAotCSstLS0tLS0tLSsgIDogKy0tLT58IENhY2hlIEQg
fDwtLS0tLS0tPnwgICAgICAgIHwKLQkgICAgICAgICAgICA6ICAgICAgKy0tLS0tLS0tLSsgICAg
ICAgICB8ICAgICAgICB8Ci0JICAgICAgICAgICAgOiAgICAgICAgICAgICAgICAgICAgICAgICAg
Ky0tLS0tLS0tKwotCSAgICAgICAgICAgIDoKLQot7J20IOyLnOyKpO2FnOydtCDri6TsnYzqs7wg
6rCZ7J2AIO2KueyEseydhCDqsJbripTri6Qg7IOd6rCB7ZW0IOu0heyLnOuLpDoKLQotICgqKSDt
mYDsiJjrsogg7LqQ7Iuc65287J247J2AIOy6kOyLnCBBLCDsupDsi5wgQyDrmJDripQg66mU66qo
66as7JeQIOychOy5mO2VoCDsiJgg7J6I7J2MOwotCi0gKCopIOynneyImOuyiCDsupDsi5zrnbzs
nbjsnYAg7LqQ7IucIEIsIOy6kOyLnCBEIOuYkOuKlCDrqZTrqqjrpqzsl5Ag7JyE7LmY7ZWgIOyI
mCDsnojsnYw7Ci0KLSAoKikgQ1BVIOy9lOyWtOqwgCDtlZzqsJzsnZgg7LqQ7Iuc7JeQIOygkeq3
vO2VmOuKlCDrj5nslYgsIOuLpOuluCDsupDsi5zripQgLSDrjZTti7Ag7LqQ7Iuc65287J247J2E
Ci0gICAgIOuplOuqqOumrOyXkCDrgrTrpqzqsbDrgpgg7LaU7Lih7ISxIOuhnOuTnOulvCDtlZjq
sbDrgpgg7ZWY6riwIOychO2VtCAtIOyLnOyKpO2FnOydmCDri6Trpbgg67aA67aE7JeQCi0gICAg
IOyVoeyEuOyKpCDtlZjquLAg7JyE7ZW0IOuyhOyKpOulvCDsgqzsmqntlaAg7IiYIOyeiOydjDsK
LQotICgqKSDqsIEg7LqQ7Iuc64qUIOyLnOyKpO2FnOydmCDrgpjrqLjsp4Ag67aA67aE65Ok6rO8
IOydvOq0gOyEseydhCDrp57stpTquLAg7JyE7ZW0IO2VtOuLuSDsupDsi5zsl5AKLSAgICAg7KCB
7Jqp65CY7Ja07JW8IO2VoCDsmKTtjbzroIjsnbTshZjrk6TsnZgg7YGQ66W8IOqwgOynkDsKLQot
ICgqKSDsnbQg7J286rSA7ISxIO2BkOuKlCDsupDsi5zsl5Ag7J2066+4IOyhtOyerO2VmOuKlCDr
nbzsnbjsl5Ag6rCA7ZW07KeA64qUIO2PieuylO2VnCDroZzrk5zsl5Ag7J2Y7ZW07ISc64qUCi0g
ICAgIOu5hOybjOyngOyngCDslYrripTrjbAsIO2BkOydmCDsmKTtjbzroIjsnbTshZjrk6TsnbQg
7J20IOuhnOuTnOydmCDqsrDqs7zsl5Ag7JiB7Zal7J2EIOuBvOy5oCDsiJgg7J6I64ukCi0gICAg
IO2VoOyngOudvOuPhCDqt7jrn6ztlaguCi0KLeydtOygnCwg7LKr67KI7Ke4IENQVSDsl5DshJwg
65GQ6rCc7J2YIOyTsOq4sCDsmKTtjbzroIjsnbTshZjsnYQg66eM65Oc64qU642wLCDtlbTri7kg
Q1BVIOydmCDsupDsi5zsl5AKLeyalOyyreuQnCDsiJzshJzroZwg7Jik7Y2866CI7J207IWY7J20
IOuPhOuLrOuQqOydhCDrs7TsnqXtlZjquLAg7JyE7ZW0IOuRkCDsmKTtjbzroIjsnbTshZgg7IKs
7J207JeQIOyTsOq4sAot67Cw66as7Ja066W8IOyCrOyaqe2VmOuKlCDsg4HtmansnYQg7IOB7IOB
7ZW0IOu0heyLnOuLpDoKLQotCUNQVSAxCQlDUFUgMgkJQ09NTUVOVAotCT09PT09PT09PT09PT09
PQk9PT09PT09PT09PT09PT0JPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0JCQkJCXUgPT0gMCwgdiA9PSAxIGFuZCBwID09ICZ1LCBxID09ICZ1Ci0JdiA9IDI7Ci0Jc21w
X3dtYigpOwkJCXYg7J2YIOuzgOqyveydtCBwIOydmCDrs4Dqsr0g7KCE7JeQIOuztOydvCDqsoPs
nYQKLQkJCQkJIOu2hOuqhe2eiCDtlagKLQk8QTptb2RpZnkgdj0yPgkJCXYg64qUIOydtOygnCDs
upDsi5wgQSDsl5Ag64+F7KCQ7KCB7Jy866GcIOyhtOyerO2VqAotCXAgPSAmdjsKLQk8Qjptb2Rp
ZnkgcD0mdj4JCQlwIOuKlCDsnbTsoJwg7LqQ7IucIEIg7JeQIOuPheygkOyggeycvOuhnCDsobTs
nqztlagKLQot7Jes6riw7ISc7J2YIOyTsOq4sCDrqZTrqqjrpqwg67Cw66as7Ja064qUIENQVSAx
IOydmCDsupDsi5zqsIAg7Jis67CU66W4IOyInOyEnOuhnCDsl4XrjbDsnbTtirgg65CcIOqyg+yc
vOuhnAot7Iuc7Iqk7YWc7J2YIOuLpOuluCBDUFUg65Ok7J20IOyduOyngO2VmOqyjCDrp4zrk63r
i4jri6QuICDtlZjsp4Drp4wsIOydtOygnCDrkZDrsojsp7ggQ1BVIOqwgCDqt7gg6rCS65Ok7J2E
Ci3snb3snLzroKQg7ZWY64qUIOyDge2ZqeydhCDsg53qsIHtlbQg67SF7Iuc64ukOgotCi0JQ1BV
IDEJCUNQVSAyCQlDT01NRU5UCi0JPT09PT09PT09PT09PT09CT09PT09PT09PT09PT09PQk9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLQkuLi4KLQkJCXEgPSBwOwotCQkJ
eCA9ICpxOwotCi3snITsnZgg65GQ6rCc7J2YIOydveq4sCDsmKTtjbzroIjsnbTshZjsnYAg7JiI
7IOB65CcIOyInOyEnOuhnCDsnbzslrTrgpjsp4Ag66q77ZWgIOyImCDsnojripTrjbAsIOuRkOuy
iOynuCBDUFUKLeydmCDtlZwg7LqQ7Iuc7JeQIOuLpOuluCDsupDsi5wg7J2067Kk7Yq46rCAIOuw
nOyDne2VtCB2IOulvCDri7Tqs6Ag7J6I64qUIOy6kOyLnOudvOyduOydmCDtlbTri7kg7LqQ7Iuc
7JeQ7J2YCi3sl4XrjbDsnbTtirjqsIAg7KeA7Jew65CY64qUIOyCrOydtCwgcCDrpbwg64u06rOg
IOyeiOuKlCDsupDsi5zrnbzsnbjsnYAg65GQ67KI7Ke4IENQVSDsnZgg64uk66W4IOy6kOyLnOyX
kAot7JeF642w7J207Yq4IOuQmOyWtOuyhOuguOydhCDsiJgg7J6I6riwIOuVjOusuOyeheuLiOuL
pC4KLQotCUNQVSAxCQlDUFUgMgkJQ09NTUVOVAotCT09PT09PT09PT09PT09PQk9PT09PT09PT09
PT09PT0JPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0JCQkJCXUgPT0g
MCwgdiA9PSAxIGFuZCBwID09ICZ1LCBxID09ICZ1Ci0JdiA9IDI7Ci0Jc21wX3dtYigpOwotCTxB
Om1vZGlmeSB2PTI+CTxDOmJ1c3k+Ci0JCQk8QzpxdWV1ZSB2PTI+Ci0JcCA9ICZ2OwkJcSA9IHA7
Ci0JCQk8RDpyZXF1ZXN0IHA+Ci0JPEI6bW9kaWZ5IHA9JnY+CTxEOmNvbW1pdCBwPSZ2PgotCQkJ
PEQ6cmVhZCBwPgotCQkJeCA9ICpxOwotCQkJPEM6cmVhZCAqcT4J7LqQ7Iuc7JeQIOyXheuNsOyd
tO2KuCDrkJjquLAg7KCE7J2YIHYg66W8IOydveydjAotCQkJPEM6dW5idXN5PgotCQkJPEM6Y29t
bWl0IHY9Mj4KLQot6riw67O47KCB7Jy866GcLCDrkZDqsJzsnZgg7LqQ7Iuc65287J24IOuqqOuR
kCBDUFUgMiDsl5Ag7LWc7KKF7KCB7Jy866Gc64qUIOyXheuNsOydtO2KuCDrkKAg6rKD7J207KeA
66eMLAot67OE64+E7J2YIOqwnOyehSDsl4bsnbTripQsIOyXheuNsOydtO2KuOydmCDsiJzshJzq
sIAgQ1BVIDEg7JeQ7IScIOunjOuTpOyWtOynhCDsiJzshJzsmYAg64+Z7J287ZWgCi3qsoPsnbTr
nbzripQg67O07J6l7J20IOyXhuyKteuLiOuLpC4KLQotCi3sl6zquLDsl5Ag6rCc7J6F7ZWY6riw
IOychO2VtOyEoCwg642w7J207YSwIOydmOyhtOyEsSDrsLDrpqzslrTrgpgg7J296riwIOuwsOum
rOyWtOulvCDroZzrk5wg7Jik7Y2866CI7J207IWY65OkCi3sgqzsnbTsl5Ag64Sj7Ja07JW8IO2V
qeuLiOuLpCAodjQuMTUg67aA7YSw64qUIFJFQURfT05DRSgpIOunpO2BrOuhnOyXkCDsnZjtlbQg
66y07KGw6rG07KCB7Jy866GcCi3qt7jroIfqsowg65Cp64uI64ukKS4gIOydtOugh+qyjCDtlajs
nLzroZzsjagg7LqQ7Iuc6rCAIOuLpOydjCDsmpTssq3snYQg7LKY66as7ZWY6riwIOyghOyXkCDs
nbzqtIDshLEg7YGQ66W8Ci3sspjrpqztlZjrj4TroZ0g6rCV7KCc7ZWY6rKMIOuQqeuLiOuLpC4K
LQotCUNQVSAxCQlDUFUgMgkJQ09NTUVOVAotCT09PT09PT09PT09PT09PQk9PT09PT09PT09PT09
PT0JPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0JCQkJCXUgPT0gMCwg
diA9PSAxIGFuZCBwID09ICZ1LCBxID09ICZ1Ci0JdiA9IDI7Ci0Jc21wX3dtYigpOwotCTxBOm1v
ZGlmeSB2PTI+CTxDOmJ1c3k+Ci0JCQk8QzpxdWV1ZSB2PTI+Ci0JcCA9ICZ2OwkJcSA9IHA7Ci0J
CQk8RDpyZXF1ZXN0IHA+Ci0JPEI6bW9kaWZ5IHA9JnY+CTxEOmNvbW1pdCBwPSZ2PgotCQkJPEQ6
cmVhZCBwPgotCQkJc21wX3JlYWRfYmFycmllcl9kZXBlbmRzKCkKLQkJCTxDOnVuYnVzeT4KLQkJ
CTxDOmNvbW1pdCB2PTI+Ci0JCQl4ID0gKnE7Ci0JCQk8QzpyZWFkICpxPgnsupDsi5zsl5Ag7JeF
642w7J207Yq4IOuQnCB2IOulvCDsnb3snYwKLQotCi3snbTrn7Ag67aA66WY7J2YIOusuOygnOuK
lCBERUMgQWxwaGEg6rOE7Je0IO2UhOuhnOyEuOyEnOuTpOyXkOyEnCDrsJzqsqzrkKAg7IiYIOye
iOuKlOuNsCwg7J2065Ok7J2ACi3rjbDsnbTthLAg67KE7Iqk66W8IOyigCDrjZQg7J6YIOyCrOya
qe2VtCDshLHriqXsnYQg6rCc7ISg7ZWgIOyImCDsnojripQsIOu2hO2VoOuQnCDsupDsi5zrpbwg
6rCA7KeA6rOgIOyeiOq4sAot65WM66y47J6F64uI64ukLiAg64yA67aA67aE7J2YIENQVSDripQg
7ZWY64KY7J2YIOydveq4sCDsmKTtjbzroIjsnbTshZjsnZgg66mU66qo66asIOyVoeyEuOyKpOqw
gCDri6Trpbgg7J296riwCi3smKTtjbzroIjsnbTshZjsl5Ag7J2Y7KG07KCB7J20652866m0IOuN
sOydtO2EsCDsnZjsobTshLEg67Cw66as7Ja066W8IOuCtO2PrOyLnO2CteuLiOuLpOunjCwg66qo
65GQ6rCAIOq3uOufsOqxtAot7JWE64uI6riwIOuVjOusuOyXkCDsnbTsoJDsl5Ag7J2Y7KG07ZW0
7ISgIOyViOuQqeuLiOuLpC4KLQot64uk66W4IENQVSDrk6Trj4Qg67aE7ZWg65CcIOy6kOyLnOul
vCDqsIDsp4Dqs6Ag7J6I7J2EIOyImCDsnojsp4Drp4wsIOq3uOufsCBDUFUg65Ok7J2AIO2Pieuy
lO2VnCDrqZTrqqjrpqwKLeyVoeyEuOyKpOulvCDsnITtlbTshJzrj4Qg7J20IOu2hO2VoOuQnCDs
upDsi5zrk6Qg7IKs7J207J2YIOyhsOygleydhCDtlbTslbzrp4wg7ZWp64uI64ukLiAgQWxwaGEg
64qUIOqwgOyepQot7JW97ZWcIOuplOuqqOumrCDsiJzshJwg7Iuc66eo7YuxIChzZW1hbnRpYykg
7J2EIOyEoO2Dne2VqOycvOuhnOyNqCDrqZTrqqjrpqwg67Cw66as7Ja06rCAIOuqheyLnOyggeyc
vOuhnAot7IKs7Jqp65CY7KeAIOyViuyVmOydhCDrlYzsl5DripQg6re465+wIOyhsOygleydtCDt
lYTsmpTtlZjsp4Ag7JWK6rKMIO2WiOycvOupsCwg7J2064qUIEFscGhhIOqwgCDri7nsi5zsl5AK
LeuNlCDrhpLsnYAgQ1BVIO2BtOudvSDsho3rj4Trpbwg6rCA7KeIIOyImCDsnojqsowg7ZaI7Iq1
64uI64ukLiAg7ZWY7KeA66eMLCAo64uk7IucIOunkO2VmOqxtOuMgCwgdjQuMTUKLeydtO2bhOu2
gO2EsOuKlCkgQWxwaGEg7JWE7YKk7YWN7LOQIOyghOyaqSDsvZTrk5zsmYAgUkVBRF9PTkNFKCkg
66ek7YGs66GcIOuCtOu2gOyXkOyEnOulvCDsoJzsmbjtlZjqs6DripQKLXNtcF9yZWFkX2JhcnJp
ZXJfZGVwZW5kcygpIOqwgCDsgqzsmqnrkJjsp4Ag7JWK7JWE7JW8IO2VqOydhCDslYzslYTrkZDs
i5zquLAg67CU656N64uI64ukLgotCi0KIOy6kOyLnCDsnbzqtIDshLEgVlMgRE1BCiAtLS0tLS0t
LS0tLS0tLS0tLS0KIApAQCAtMjk2MiwxMCArMjgyNCw4IEBAIEFscGhhIENQVSDsnZgg7J2867aA
IOuyhOyghOydgCDrtoTtlaDrkJwg642w7J207YSwIOy6kOyLnOulvCDqsIDsp4Dqs6Ag7J6I7Ja0
7IScCiDrjbDsnbTthLDsnZgg67Cc6rKs7J2EIOyYrOuwlOuluCDsiJzshJzroZwg7J287Ja064KY
6rKMIO2VmOq4sCDrlYzrrLjsnoXri4jri6QuCiAKIOumrOuIheyKpCDsu6TrhJDsnZgg66mU66qo
66asIOuwsOumrOyWtCDrqqjrjbjsnYAgQWxwaGEg7JeQIOq4sOy0iO2VtOyEnCDsoJXsnZjrkJjs
l4jsirXri4jri6Trp4wsIHY0LjE1Ci3rtoDthLDripQg66as64iF7IqkIOy7pOuEkOydtCBSRUFE
X09OQ0UoKSDrgrTsl5Agc21wX3JlYWRfYmFycmllcl9kZXBlbmRzKCkg66W8IOy2lOqwgO2VtOyE
nAotQWxwaGEg7J2YIOuplOuqqOumrCDrqqjrjbjroZzsnZgg7JiB7Zal66Cl7J20IO2BrOqyjCDs
pITslrTrk6TquLQg7ZaI7Iq164uI64ukLgotCi3snITsnZggIuy6kOyLnCDsnbzqtIDshLEiIOyE
nOu4jOyEueyFmOydhCDssLjqs6DtlZjshLjsmpQuCivrtoDthLDripQgQWxwaGEg7JqpIFJFQURf
T05DRSgpIOy9lOuTnCDrgrTsl5Agc21wX21iKCkg6rCAIOy2lOqwgOuQmOyWtOyEnCDrqZTrqqjr
pqwg66qo642466Gc7J2YCitBbHBoYSDsnZgg7JiB7Zal66Cl7J20IO2BrOqyjCDspITslrTrk6Ts
l4jsirXri4jri6QuCiAKIAog6rCA7IOBIOuouOyLoCDqsozsiqTtirgKLS0gCjIuMjcuMC4yMTIu
Z2U4YmExY2M5ODgtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
